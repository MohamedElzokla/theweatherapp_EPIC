//
//  LocationManager.swift
//  TheWeather
//
//  Created by mohamed ahmed on 19/11/2021.
//

import Foundation
import CoreLocation
import UIKit
class LocationManager : NSObject {
    
    static let shared = LocationManager()
    let manager = CLLocationManager()
    
    var currentLocation : LocationBean?
    var onLocation : ((LocationBean?,Bool) -> ())?
    var hasPermission : Bool {
        if CLLocationManager.locationServicesEnabled() {
            switch manager.authorizationStatus {
            case  .restricted, .denied:
                return false
            case .authorizedAlways, .authorizedWhenInUse,.notDetermined:
                return true
            @unknown default:
                return false
            }
        } else {
            return false
        }
        
    }
    
    /// Get current location if permission was granted , if not then it should show an alert for hinting user to go to settings to grant it
    /// - Parameter block: returned location object if any and status to indicate if it was successded or not
    func getLocation(onComplete block:((LocationBean?,Bool) -> ())?) {
        if let currentLocation = self.currentLocation ,let _ = currentLocation.locationCoordinate?.latitude{
            block?(currentLocation,true)
        }else{
            onLocation = block
            self.getLocation()
        }
    }
    private func getLocation() {
        
        if hasPermission {
            manager.delegate = self
            manager.distanceFilter = kCLDistanceFilterNone
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
        } else {
            openLocationServicesAlertController()
        }
    }
    /// show hint alert for user to grant location from settings
    func openLocationServicesAlertController(){
        let alert = UIAlertController(title: "Alert".localized(), message: "LocationManager.ask.permission".localized(), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Allow".localized(), style: .default, handler: { _ in
            if let aString = URL(string: UIApplication.openSettingsURLString){
                UIApplication.shared.open(aString, options: [:], completionHandler: nil)
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel".localized(), style: .default, handler: nil))
        UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
    }
}

extension LocationManager:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("new current location")
        let lat = (locations.first?.coordinate.latitude) ?? 0.0
        let lng = (locations.first?.coordinate.longitude) ?? 0.0
        
        //cache current location for later use
        self.currentLocation = LocationBean.initWith(lat: lat , long: lng, address: "")
        
        //execute saved callback if any
        self.onLocation?(self.currentLocation, true)
        
        // reset callback action so that it doesn't get called more than one time
        self.onLocation = nil
        
        // stop updating location
        manager.stopUpdatingLocation()
        
        
    }
    
    
    
}

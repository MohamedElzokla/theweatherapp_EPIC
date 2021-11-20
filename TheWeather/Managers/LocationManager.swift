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
    func getLocationFromAddress(address:String,onComplete:((CLLocationCoordinate2D?)->())?){
        CLGeocoder().geocodeAddressString(address, completionHandler: { placemarks, error in
                   if (error != nil) {
                       return
                   }

                   if let placemark = placemarks?[0]  {
                       let lat = String(format: "%.04f", (placemark.location?.coordinate.longitude ?? 0.0)!)
                       let lon = String(format: "%.04f", (placemark.location?.coordinate.latitude ?? 0.0)!)
                       let name = placemark.name!
                       let country = placemark.country!
                       let region = placemark.administrativeArea!
                     print("\(lat),\(lon)\n\(name),\(region) \(country)")
                       onComplete?(placemark.location?.coordinate)
                   }
               })
    }
}

extension LocationManager:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("new current location")
        let lat = (locations.first?.coordinate.latitude) ?? 0.0
        let lng = (locations.first?.coordinate.longitude) ?? 0.0
        self.currentLocation = LocationBean.initWith(lat: lat , long: lng, address: "")
        
        self.onLocation?(self.currentLocation, true)
        self.onLocation = nil
        manager.stopUpdatingLocation()
        
        
    }
    
    
    
}

//
//  LocationManager.swift
//  TheWeather
//
//  Created by mohamed ahmed on 19/11/2021.
//

import Foundation
import CoreLocation
class LocationManager : NSObject {
    static let shared = LocationManager()
    
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

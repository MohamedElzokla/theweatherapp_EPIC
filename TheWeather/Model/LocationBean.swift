//
//  LocationBean.swift
//  TheWeather
//
//  Created by mohamed ahmed on 20/11/2021.
//
import CoreLocation
import Foundation
class LocationBean: NSObject {
    
    var locationCoordinate : CLLocationCoordinate2D?
    var address : String?
    
    
    class func initWith(coordinate:CLLocationCoordinate2D,onComplete: ((LocationBean)->())?){
        let bean = LocationBean()
        bean.locationCoordinate = coordinate
        onComplete?(bean)

    }

    class func initWith(lat:CLLocationDegrees,long:CLLocationDegrees,address:String)->LocationBean{
        let bean = LocationBean()
        let coordinate = CLLocationCoordinate2D.init(latitude: lat, longitude: long)
        bean.locationCoordinate = coordinate
        bean.address = address
        return bean
    }
}

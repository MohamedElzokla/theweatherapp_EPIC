//
//  WeatherDetailsResponse.swift
//  TheWeather
//
//  Created by mohamed ahmed on 19/11/2021.
//

import Foundation
import ObjectMapper
import CoreLocation

class WeatherDetailsResponse : APIResponse {
    var data : WeatherDetails?
    var locationLat :Double?
    var locationLng :Double?
    var location : CLLocationCoordinate2D {
        return CLLocationCoordinate2D.init(latitude: locationLat ?? 0.0 , longitude: locationLng ?? 0.0)
    }
   override func mapping(map: Map) {
       super.mapping(map: map)
       data <- map["current"]
       locationLat <- map["location.lat"]
       locationLng <- map["location.lon"]
    }
}
class WeatherDetails : NSObject , Mappable {
    var temp : Double?
    var humidity : Double?
    var pressure: Double? // in bar
    var precipitation : Double? // in mm
    var conditionStatus :String?
    var conditionStatusImage : String?
    var conditionStatusImageUrl : URL?{
        return "https:\(conditionStatusImage ?? "")".url()
    }

    
    func mapping(map: Map) {
        temp <- map["temp_f"]
        humidity <- map["humidity"]
        conditionStatus <- map["condition.text"]
        conditionStatusImage <- map["condition.icon"]
        pressure <- map["pressure_mb"]
        precipitation <- map["precip_mm"]
        
    }
    required init?(map: Map) {
        
    }
}

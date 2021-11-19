//
//  WeatherDetailsResponse.swift
//  TheWeather
//
//  Created by mohamed ahmed on 19/11/2021.
//

import Foundation
import ObjectMapper

class WeatherDetailsResponse : APIResponse {
    var data : WeatherDetails?
  
   override func mapping(map: Map) {
       super.mapping(map: map)
       data <- map["current"]
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
        return conditionStatusImage?.url()
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

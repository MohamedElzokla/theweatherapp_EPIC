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
    var locationLat :Double?
    var locationLng :Double?
    var location : LocationBean {
        return LocationBean.initWith(lat: locationLat ?? 0.0, long: locationLng ?? 0.0, address: "")
    }
    var areaName : String?
    var areaRegion : String?
    var areaCountry : String?
    
    var area : String? {
        return [areaName,areaRegion,areaCountry].compactMap({$0}).joined(separator: " , ")
    }
   override func mapping(map: Map) {
       super.mapping(map: map)
       data <- map["current"]
       locationLat <- map["location.lat"]
       locationLng <- map["location.lon"]
       areaName <- map["location.name"]
       areaRegion <- map["location.region"]
       areaCountry <- map["location.country"]
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

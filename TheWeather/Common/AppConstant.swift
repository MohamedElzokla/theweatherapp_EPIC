//
//  AppConstant.swift
//  TheWeather
//
//  Created by mohamed ahmed on 19/11/2021.
//

import Foundation
enum ConfigurationMode {
    case development
    case production
}
struct AppConstant {
    static var googleAPIKey = "AIzaSyBTIUFP-zhf1f_jZCQLlOsgDwb_W7nyyzM"
    static var configurationMode : ConfigurationMode = .production
    static var DOMAIN :String{
         if configurationMode == .development{
            return "https://api.weatherapi.com"
        } else if configurationMode == .production{
            return "https://api.weatherapi.com"  
        } else{
            return ""
        }
    }
    
    static var apiWeatherKey :String {
        if configurationMode == .development{
           return "99182c74b18746de9e4193325211911"
       } else if configurationMode == .production{
           return "99182c74b18746de9e4193325211911"
       } else{
           return ""
       }
    }
    
}

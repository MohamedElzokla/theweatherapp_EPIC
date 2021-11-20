//
//  APIResponse.swift
//  TheWeather
//
//  Created by mohamed ahmed on 19/11/2021.
//

import Foundation
import ObjectMapper

class APIResponse : NSObject,Mappable{
    
    var errorMessage :String?
    var isSuccess = false
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        errorMessage <- map["error.message"]
        isSuccess = (errorMessage?.isEmpty ?? true)
    }
   
}

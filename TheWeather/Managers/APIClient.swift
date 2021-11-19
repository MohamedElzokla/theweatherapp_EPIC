//
//  APIClient.swift
//  TheWeather
//
//  Created by mohamed ahmed on 19/11/2021.
//

import Foundation

class APIClient{
    class func getHeader()-> HTTPHeaders {

        let dict = [
            "Content-Type": "application/json",
            "cache-control": "no-cache",
        ]
        
        return  dict
    }
    class func getWeatherData(query:String,onComplete:((WeatherDetailsResponse?)->())?){
        let params : [String :String] = [ "q":query,
                                          "key":AppConstant.apiWeatherKey,
                                          "days":"1"]
        APIClient.sendGetRequest(path: APIMethod.currentWeather.rawValue, params: params) { json in
            onComplete?(WeatherDetailsResponse(JSON: json ?? JSON()))
        }
    }
    
    class func sendGetRequest(path:String,params:JSON?,onComplete:((JSON?)->())?){
        let headers = APIClient.getHeader()

        var urlString = AppConstant.DOMAIN + path
        if let params = params {
            let urlComponent = NSURLComponents(string: urlString)
            var urlItems = [URLQueryItem]()
            params.forEach { (arg) in
                 let (key, value) = arg
                urlItems.append(URLQueryItem(name: key, value: "\(value)"))

            }
            urlComponent?.queryItems = urlItems
            urlString = urlComponent?.url?.absoluteString.replacingOccurrences(of: "+", with: "%2B") ?? urlString
        }

        let request = NSMutableURLRequest(url: URL(string: urlString)!,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 30.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            DispatchQueue.main.async {
                if (error != nil) {
                    onComplete?(["error":["message":"error.api.failure".localized()]])
                } else {
                    if let data = data , let jsonObj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? JSON{
                        onComplete?(jsonObj)
                    }else{
                        onComplete?(["error":["message":"error.api.failure".localized()]])
                    }
                    
                }
            }
         
        }).resume()


    }
}
enum APIMethod : String {
    case currentWeather = "/v1/current.json"

}

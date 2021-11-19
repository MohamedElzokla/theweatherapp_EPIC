//
//  Util.swift
//  TheWeather
//
//  Created by mohamed ahmed on 19/11/2021.
//

import Foundation
import Network
class Util : NSObject {
    static let shared = Util()
    
    class func checkNetworkConnection(onFinish:BoolBlock? = nil){
        let queue = DispatchQueue.global()
        let monitor = NWPathMonitor()
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                onFinish?((path.status == .satisfied))
            }
        }
    }
    
}

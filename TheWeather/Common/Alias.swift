//
//  Alias.swift
//  TheWeather
//
//  Created by mohamed ahmed on 19/11/2021.
//

import Foundation
typealias ActionBlock = ()->()
typealias BoolBlock = (Bool)->()
typealias HTTPHeaders = [String: String]
typealias JSON = [String: Any]
typealias ResultCompletionHandler = (JSON?) -> ()

//
//  String+Extension.swift
//  TheWeather
//
//  Created by mohamed ahmed on 19/11/2021.
//

import Foundation
extension String {
    func localized()->String{
        return NSLocalizedString(self, comment: "")
    }
    func url()->URL?{
        return URL.init(string: self)
    }
}

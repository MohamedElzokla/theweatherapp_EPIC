//
//  UILabel+Extension.swift
//  TheWeather
//
//  Created by mohamed ahmed on 19/11/2021.
//

import UIKit

extension UILabel {
    @IBInspectable
    var localizedText : String {
        get {
            return self.text ?? ""
        }
        set {
            text = NSLocalizedString(newValue, comment: "")
        }
    }
}

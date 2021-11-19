//
//  UiButton+Extension.swift
//  TheWeather
//
//  Created by mohamed ahmed on 19/11/2021.
//

import UIKit

extension UIButton {
    @IBInspectable
    var localizedTitle :String {
        get{
            self.title(for: .normal) ?? ""
        }
        set{
            setTitle(newValue.localized() , for: .normal)
        }
    }
  
}

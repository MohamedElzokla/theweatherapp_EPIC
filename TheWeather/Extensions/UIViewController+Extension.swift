//
//  UIViewController+Extension.swift
//  TheWeather
//
//  Created by mohamed ahmed on 19/11/2021.
//

import UIKit
extension  UIViewController {
    
    enum UIStoryboardName :String{
        case main = "Main"
    }
    static func storyboardViewController(storyBoardName:UIStoryboardName ,identifier:String) -> UIViewController? {
        let storyboard = UIStoryboard(name: storyBoardName.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }

    static func storyboardNavigationController(storyBoardName:UIStoryboardName,identifier:String) -> UINavigationController? {
        let storyboard = UIStoryboard(name: storyBoardName.rawValue, bundle: nil)

        guard let nc = storyboard.instantiateViewController(withIdentifier: identifier) as? UINavigationController else {
            fatalError("Could not instantiate initial storyboard with name: \(storyBoardName)")
        }
        
        return nc
    }
}

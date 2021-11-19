//
//  AppDelegate.swift
//  TheWeather
//
//  Created by mohamed ahmed on 19/11/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    static var shared:AppDelegate{
        return UIApplication.shared.delegate as! AppDelegate
    }
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        StartupManager.shared.run()

        return true
    }

    
}


//
//  StartupManager.swift
//  TheWeather
//
//  Created by mohamed ahmed on 19/11/2021.
//

import UIKit
import IQKeyboardManagerSwift

class StartupManager: NSObject {

    static var shared = StartupManager()
    
    func run(){
        
        startAppView()

        configureKeyboard()
    }
    
    /// initialize main window and set the root view controller with the first screen
    private func startAppView(){
        AppDelegate.shared.window = UIWindow(frame: UIScreen.main.bounds)
        AppDelegate.shared.window?.rootViewController = UIViewController.storyboardNavigationController(storyBoardName: .main, identifier: "LocationInputNVC")
        AppDelegate.shared.window?.makeKeyAndVisible()
    }
    
    /// Globally enable keyboard manager
    private func configureKeyboard(){
        IQKeyboardManager.shared.enable = true
    }
    
    
}

//
//  StartupManager.swift
//  TheWeather
//
//  Created by mohamed ahmed on 19/11/2021.
//

import UIKit
import IQKeyboardManagerSwift
import SVProgressHUD

class StartupManager: NSObject {

    static let shared = StartupManager()
    
    func run(){
        
        startAppView()

        configureKeyboard()
        
        configureProgress()
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
    
    private func configureProgress(){
        SVProgressHUD.setDefaultMaskType(.black)
    }
    
    
}

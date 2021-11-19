//
//  LocationInputVC.swift
//  TheWeather
//
//  Created by mohamed ahmed on 19/11/2021.
//

import UIKit
class LocationInputVC : BaseViewController {
    
    @IBOutlet weak var addressTextField : UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "LocationInputVC.title".localized()
    }
    
   
}

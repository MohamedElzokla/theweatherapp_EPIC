//
//  LocationInputVC.swift
//  TheWeather
//
//  Created by mohamed ahmed on 19/11/2021.
//

import UIKit
class LocationInputVC : BaseViewController {
    
    @IBOutlet weak var addressTextField : UITextField?
    @IBOutlet weak var goBtn : UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "LocationInputVC.title".localized()
    }
    private func geocodeAddressString(inputAddress:String){
        showLoadingIndicator()
        APIClient.getWeatherData(query: inputAddress) { [weak self] response in
            self?.hideLoadingIndicator()
            if response?.isSuccess ?? false{
                
            }else{
                self?.showAlert(response: response)
            }
        }
    }
    //MARK: - UI helpers
    

   //MARK: - Actions
    @IBAction private func addressGoBtnAction(){

        guard let address = addressTextField?.text ,address.isEmpty == false else{
            showAlert(message: "LocationInputVC.empty.address.alert".localized())
            return
        }
        Util.checkNetworkConnection(onFinish: { [weak self] isConnected in
            if isConnected{
                self?.geocodeAddressString(inputAddress: address)
            }else{
                self?.showAlert(message: "error.networkerror".localized() )
            }
        })
    }
}

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
                self?.openDetails(response: response)
            }else{
                self?.showAlert(response: response)
            }
        }
    }
    private func openDetails(response:WeatherDetailsResponse?){
        if let vc = UIViewController.storyboardViewController(storyBoardName: .main, identifier: "WeatherDetailsVC") as? WeatherDetailsVC{
            vc.response = response
            self.navigationController?.pushViewController(vc, animated: true)

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
    
    @IBAction private func myWeatherBtnAction(){
        LocationManager.shared.getLocation { [weak self](bean, success) in
            if success , let bean = bean {
                self?.geocodeAddressString(inputAddress: "\(bean.locationCoordinate?.latitude ?? 0.0),\(bean.locationCoordinate?.longitude ?? 0.0)")
            }
        }
    }
    @IBAction private func closeKeyboard(){
        self.view.endEditing(true)
    }
}

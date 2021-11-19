//
//  BaseViewController.swift
//  TheWeather
//
//  Created by mohamed ahmed on 19/11/2021.
//

import UIKit
import SVProgressHUD

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //MARK: - Alert
    func showAlert(title:String = "alert.title".localized() ,
                   message : String?,
                   onOK : ActionBlock? = nil
    ){
        let alertController = UIAlertController(title: title, message: message ?? "", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "alert.close".localized(), style: .default, handler: { _ in
            onOK?()
        }))
        present(alertController, animated: true, completion: nil)
    }
    func showAlert(response:APIResponse?){
        showAlert(message: response?.errorMessage)
    }
    //MARK: - Loading indicator
    func showLoadingIndicator (message:String = ""){
        if message == "" {
            SVProgressHUD.show()
        }else{
            SVProgressHUD.show(withStatus: message)
        }
    }
    func hideLoadingIndicator (){
        SVProgressHUD.dismiss()
    }
    
    

}

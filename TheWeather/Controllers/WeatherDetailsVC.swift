//
//  WeatherDetailsVC.swift
//  TheWeather
//
//  Created by mohamed ahmed on 19/11/2021.
//

import UIKit
import SDWebImage
import GoogleMaps
class WeatherDetailsVC: BaseViewController {


    @IBOutlet weak var mapView: GMSMapView?
    @IBOutlet weak var tempLabel : UILabel?
    @IBOutlet weak var pressureLabel : UILabel?
    @IBOutlet weak var humidityLabel : UILabel?
    @IBOutlet weak var conditionLabel : UILabel?
    @IBOutlet weak var conditionImageView : UIImageView?
    @IBOutlet weak var precipitationLabel : UILabel?

    var response:WeatherDetailsResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "WeatherDetailsVC.title".localized()
        renderUI()

    }
    override func loadView() {
        super.loadView()
        let camera = GMSCameraPosition.camera(withLatitude:response?.locationLat ?? 0.0, longitude: response?.locationLng ?? 0.0, zoom: 12.0)
        mapView?.camera = camera

    }
    private func renderUI(){
        tempLabel?.text = String(format: "%.1f", response?.data?.temp ?? 0.0)
        pressureLabel?.text = String(format: "%.1f", response?.data?.pressure ?? 0.0)
        conditionLabel?.text = response?.data?.conditionStatus
        humidityLabel?.text = String(format: "%.1f%@", response?.data?.humidity ?? 0.0, "%" )
        precipitationLabel?.text = String(format: "%.1f", response?.data?.precipitation ?? 0.0)
        conditionImageView?.sd_setImage(with: response?.data?.conditionStatusImageUrl, completed: nil)
    }
    

}

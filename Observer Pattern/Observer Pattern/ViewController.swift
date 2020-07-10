//
//  ViewController.swift
//  Observer Pattern
//
//  Created by Bathi Babu on 10/07/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var weatherInfo: NotificationCenter<WeatherInfo>?
    var viewModel: ViewModel!
    
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var pressureLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherInfo = NotificationCenter()
        viewModel = ViewModel(weatherDetails: WeatherInfoUpdated.weatherChanged)
        weatherInfo?.registerObserver(observer: viewModel)
        
        viewModel.updateWeatherInUI = { [weak self] weather in
            
            DispatchQueue.main.async {
                
                self?.tempLbl.text = weather.temperature ?? "NA"
                self?.humidityLbl.text = weather.humidity ?? "NA"
                self?.pressureLbl.text = weather.pressure ?? "NA"
            }
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func destroy(_ sender: Any) {
        
        weatherInfo?.removeObserver(observer: viewModel)
    }
    
    @IBAction func navigate(_ sender: Any) {
    
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "WeatherViewController") as! WeatherViewController
        vc.weatherInfo = weatherInfo
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

class ViewModel: ObserverProtocol {
    
    private var _id : WeatherInfoUpdated!
    var updateWeatherInUI:((WeatherInfo) -> ())?
    
    var id: WeatherInfoUpdated {
        
        get {
            
            return self._id
        }
    }
    
    init(weatherDetails: WeatherInfoUpdated) {
        
        self._id = weatherDetails
    }
    
    func update<T>(weather: T) {
        
        guard let info = weather as? WeatherInfo else { return }
        updateWeatherInUI?(info)
    }
}

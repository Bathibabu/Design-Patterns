//
//  WeatherViewController.swift
//  Observer Pattern
//
//  Created by Bathi Babu on 10/07/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    var weatherInfo: NotificationCenter<WeatherInfo>?
    @IBOutlet weak var tempField: UITextField!
    @IBOutlet weak var humidityField: UITextField!
    @IBOutlet weak var pressureField: UITextField!
    var weather = WeatherInfo()

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let weather = weatherInfo?._value else { return }
        self.weather = weather
        tempField.text = weather.temperature
        humidityField.text = weather.humidity
        pressureField.text = weather.pressure
        // Do any additional setup after loading the view.
    }
}

extension WeatherViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == tempField {
            
            weather.temperature = textField.text
            self.weatherInfo?.weather = weather
            
        }else if textField == humidityField {
            
            weather.humidity = textField.text
            self.weatherInfo?.weather.humidity = textField.text
            
        }else {
            weather.pressure = textField.text
            self.weatherInfo?.weather.pressure = textField.text
        }
    }
}


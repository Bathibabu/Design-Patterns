//
//  WeatherData.swift
//  Observer Pattern
//
//  Created by Bathi Babu on 10/07/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import Foundation

class NotificationCenter<T>: ObserverSubjectProtocol {
    
    var observers: [ObserverProtocol] = []
    
    var _value : T! = nil

    var weather: T {
        
        get {
            
            return self._value
        }
        
        set {
            
            self._value = newValue
            notifyObservers(info: newValue)
        }
    }

    func registerObserver(observer: ObserverProtocol) {
        
        observers.append(observer)
    }
    
    func removeObserver(observer: ObserverProtocol) {
        
        observers = observers.filter { $0.id != observer.id }
    }
    
    func notifyObservers(info: T) {
        
        observers.forEach { $0.update(weather: info) }
    }
}

struct WeatherInfo {
    
    var temperature: String?
    var humidity: String?
    var pressure: String?
}

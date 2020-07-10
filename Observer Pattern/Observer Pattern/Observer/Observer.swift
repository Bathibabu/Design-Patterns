//
//  Observer.swift
//  Observer Pattern
//
//  Created by Bathi Babu on 10/07/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import Foundation

protocol ObserverSubjectProtocol {
    
    associatedtype T
    
    var weather : T { get set }
    
    var observers : [ObserverProtocol] { get set }
    
    func registerObserver(observer: ObserverProtocol)
    
    func removeObserver(observer: ObserverProtocol)
    
    func notifyObservers(info: T)
}

protocol ObserverProtocol {
    
    var id : WeatherInfoUpdated { get }

    func update<T>(weather: T)
}

enum WeatherInfoUpdated: String {
    
    case weatherChanged = "WeatherChanged"
}

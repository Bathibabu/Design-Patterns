//
//  AppSettings.swift
//  Singleton Design Pattern
//
//  Created by Bathi Babu on 08/07/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import Foundation

// This singleton class is thread safe because read and write was not happing same time/
// Final prevents Sub classing
final public class AppSettings {
    
    // It stops initializing singleton as treditional class(like AppSettings() or AppSettings.init())
    private init() { }
    
    // Static will initialize only once in App life cycle
    static let shared = AppSettings()
    
    private var appSettings: [String:Any] = [:]
    
    private let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
    
}

extension AppSettings: AppSetingProtocol {
    
    func set(value: Any, key: String) {
        
        // Barrier will act as serial while updating data
        concurrentQueue.async(flags: .barrier) {
            
            self.appSettings[key] = value
        }
    }
    
    func getValueFor(key: String) -> Any? {
        
        var result: Any?
        concurrentQueue.sync {
            
            result = self.appSettings[key]
        }
        return result
    }
}

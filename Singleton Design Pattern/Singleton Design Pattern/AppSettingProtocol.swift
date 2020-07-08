//
//  AppSettingProtocol.swift
//  Singleton Design Pattern
//
//  Created by Bathi Babu on 08/07/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import Foundation

// It will give more testability
protocol AppSetingProtocol {
    
    func set(value: Any, key: String)
    func getValueFor(key: String) -> Any?
}

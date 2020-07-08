//
//  ViewController.swift
//  Singleton Design Pattern
//
//  Created by Bathi Babu on 08/07/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppSettings.shared.set(value: "Bathi", key: "Name")
        print(AppSettings.shared.getValueFor(key: "Name"))
        // Do any additional setup after loading the view.
    }


}


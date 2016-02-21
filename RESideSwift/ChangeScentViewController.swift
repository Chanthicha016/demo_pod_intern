//
//  ChangeScentViewController.swift
//  RESideSwift
//
//  Created by FaiFai on 2/21/2559 BE.
//  Copyright © 2559 miguelicious. All rights reserved.
//

import UIKit
import Eureka
import CoreLocation


class ChangeScentViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        form =
            Section()
            +++ Section("Change Scent")
            <<< PushRow<String>() {
                $0.title = "Scent Name"
                $0.selectorTitle = "Scent Name"
                $0.options = ["Peppermint", "Lemon", "Melaleuca"]
                $0.value = "Peppermint"
            }
            <<< PushRow<String>() {
                $0.title = "Intensity"
                $0.selectorTitle = "Intensity"
                $0.options = ["Heavy", "Medium", "Light"]
                $0.value = "Heavy"
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

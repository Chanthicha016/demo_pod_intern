//
//  ChangeScentViewController.swift
//  RESideSwift
//
//  Created by FaiFai on 2/19/2559 BE.
//  Copyright © 2559 FaiFai. All rights reserved.
//

import UIKit
import Eureka
import CoreLocation


class ChangeScentViewController: FormViewController {

    var ScentName = String()
    var ScantLevel = String()
    
    var ScenDatatName : [String] = []
    var ScentDataLevel : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ScentName = ScenDatatName.joinWithSeparator(" ")
        ScantLevel = ScentDataLevel.joinWithSeparator(" ")
        
        form =
            Section()
            +++ Section("Change Scent")
            <<< PushRow<String>() {
                $0.title = "Scent Name"
                $0.selectorTitle = "Scent Name"
                $0.options = ["Peppermint", "Lemon", "Melaleuca"]
                $0.value = ScentName
            }
            <<< PushRow<String>() {
                $0.title = "Intensity"
                $0.selectorTitle = "Intensity"
                $0.options = ["Heavy", "Medium", "Light"]
                $0.value = ScantLevel
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

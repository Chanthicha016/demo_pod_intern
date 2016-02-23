//
//  RootViewController.swift
//  RESideSwift
//
//  Created by FaiFai on 2/16/2559 BE.
//  Copyright © 2559 FaiFai. All rights reserved.
//

import UIKit

class RootViewController: RESideMenu, RESideMenuDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func awakeFromNib() {
        
        self.menuPreferredStatusBarStyle = UIStatusBarStyle.LightContent
        self.contentViewShadowColor = UIColor.whiteColor();
        self.contentViewShadowOffset = CGSizeMake(0, 0);
        self.contentViewShadowOpacity = 0.6;
        self.contentViewShadowRadius = 12;
        self.contentViewShadowEnabled = true;
        self.backgroundImage = UIImage(named: "bbg.jpg")
        
        self.contentViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("ContentViewController"))! as UIViewController
        self.leftMenuViewController = (self.storyboard?.instantiateViewControllerWithIdentifier("LeftMenuViewController"))! as UIViewController
    
    }
    
    // MARK: RESide Delegate Methods
    
    func sideMenu(sideMenu: RESideMenu!, willShowMenuViewController menuViewController: UIViewController!) {
    }

}

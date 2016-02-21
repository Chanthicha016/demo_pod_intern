//
//  LeftMenuViewController.swift
//  RESideSwift
//
//  Created by miguelicious on 11/25/14.
//  Copyright (c) 2014 miguelicious. All rights reserved.
//

import UIKit

class LeftMenuViewController: UIViewController {

    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .None
        tableView.frame = CGRectMake(20, (self.view.frame.size.height - 54 * 5) / 2.0, self.view.frame.size.width, 54 * 5)
        tableView.autoresizingMask = [.FlexibleTopMargin, .FlexibleBottomMargin, .FlexibleWidth]
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.opaque = false
        tableView.backgroundColor = UIColor.clearColor()
        tableView.backgroundView = nil
        tableView.bounces = false
        return tableView
    }()
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.clearColor()
        view.addSubview(tableView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


// MARK : TableViewDataSource & Delegate Methods

extension LeftMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 54
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let titles: [String] = ["Control", "Store", "Setting"]
        
        let images: [String] = ["IconProfile","IconHome","IconSettings"]
        
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 21)
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.text  = titles[indexPath.row]
        cell.selectionStyle = .None
        cell.imageView?.image = UIImage(named: images[indexPath.row])
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            self.sideMenuViewController.setContentViewController(UINavigationController(rootViewController: (self.storyboard?.instantiateViewControllerWithIdentifier("HomeViewController"))! as UIViewController)
                , animated: true)
            
            self.sideMenuViewController.hideMenuViewController()
            break
        case 1:
            
            self.sideMenuViewController.setContentViewController(UINavigationController(rootViewController: (self.storyboard?.instantiateViewControllerWithIdentifier("StoreViewController"))! as UIViewController)
                , animated: true)
            
            self.sideMenuViewController.hideMenuViewController()

            break
        case 2:
            
            self.sideMenuViewController.setContentViewController(UINavigationController(rootViewController: (self.storyboard?.instantiateViewControllerWithIdentifier("SettingViewController"))! as UIViewController)
                , animated: true)
            
            self.sideMenuViewController.hideMenuViewController()
            
            break
        default:
            break
        }
        
        
    }

}

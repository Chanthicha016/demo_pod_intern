//
//  HomeViewController.swift
//  RESideSwift
//
//  Created by FaiFai on 2/16/2559 BE.
//  Copyright © 2559 FaiFai. All rights reserved.
//

import UIKit
import Pulsar

class HomeViewController: UITableViewController {
    
    var textArray = [String]()
    var textLevel = [String]()
    
    var scentname01 = String()
    var scentname02 = String()
    var scentname03 = String()
    
    var scentlevel01 = String()
    var scentlevel02 = String()
    var scentlevel03 = String()
    
    var ScentArray = [ChangeScentSection]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textArray = ["Papermint","Lemon","Cocoa"]
        textLevel = ["Heavy","Light","Medium"]
        timeInterval = userStartTime
        
        scentname01 = textArray[0]
        scentname02 = textArray[1]
        scentname03 = textArray[2]
        
        scentlevel01 = textLevel[0]
        scentlevel02 = textLevel[1]
        scentlevel03 = textLevel[2]
        
        ScentArray = [ChangeScentSection(ScentName: [scentname01],ScentLevel: [scentlevel01]),
        ChangeScentSection(ScentName: [scentname02],ScentLevel: [scentlevel02]),
        ChangeScentSection(ScentName: [scentname03],ScentLevel: [scentlevel03])]

    }
    
    //table
    @IBOutlet weak var mainTable: UITableView!
    var dataSource:NSMutableArray = NSMutableArray()
    
     override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
     override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    
     override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomerCell
        
        
        
        cell.Pname.text = textArray[indexPath.row]
        cell.Plevel.text = textLevel[indexPath.row]
        
        
        
        self.mainTable.reloadData()
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let indextPath : NSIndexPath = self.tableView.indexPathForSelectedRow!
        
        let DestViewController = segue.destinationViewController as! ChangeScentViewController
    
        var ScentArrayTwo : ChangeScentSection
        
        ScentArrayTwo = ScentArray[indextPath.row]
        
        DestViewController.ScenDatatName = ScentArrayTwo.ScentName
        DestViewController.ScentDataLevel = ScentArrayTwo.ScentLevel

    }

    
    //timer
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var StartStopbnt: CircleButton!
    var startTime = NSTimeInterval()
    var saveElapsedTime = NSTimeInterval()
    var timer = NSTimer()
    var userStartTime = 1500.0
    var timeInterval = Double()
    var timerStopped = true
    
    
    func formatTime(elapsedTime: Double){
        let minutes = Int(elapsedTime / 60.0)
        let seconds = Int(elapsedTime % 60)
        let fraction = Int((elapsedTime - floor(elapsedTime)) * 60)
        let strMinutes = minutes > 9 ? String(minutes):"0" + String(minutes)
        let strSeconds = seconds > 9 ? String(seconds):"0" + String(seconds)
        let strFraction = fraction > 9 ? String(fraction):"0" + String(fraction)
        timerLabel.text = "\(strMinutes):\(strSeconds):\(strFraction)"
    }
    
    func updateTime() {
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        let elapsedTime: NSTimeInterval = startTime - currentTime
        saveElapsedTime = elapsedTime
        formatTime(elapsedTime)
    }
    
    @IBAction func StartStopAction(sender: AnyObject) {
        if !timer.valid && timerStopped{
            timerStopped = false
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
            startTime = NSDate.timeIntervalSinceReferenceDate() + timeInterval
        }
        else if timer.valid && !timerStopped{
            timer.invalidate()
            timeInterval = Double(saveElapsedTime)
            timerStopped = true
        }
    }
    @IBAction func didTriggerActionOnCircleButton(sender: CircleButton) {
        sender.layer.addPulse { builder in
            builder.borderColors = [
                UIColor(hue: CGFloat(rand()) / CGFloat(RAND_MAX), saturation: 1.0, brightness: 1.0, alpha: 1.0).CGColor
            ]
            builder.backgroundColors = colorsWithHalfOpacity(builder.borderColors)
        }
    }
    

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}
    
    
}

func colorsWithHalfOpacity(colors: [CGColor]) -> [CGColor] {
    return colors.map({ CGColorCreateCopyWithAlpha($0, CGColorGetAlpha($0) * 0.5)! })
}

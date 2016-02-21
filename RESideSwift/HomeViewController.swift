//
//  HomeViewController.swift
//  RESideSwift
//
//  Created by miguelicious on 11/24/14.
//  Copyright (c) 2014 miguelicious. All rights reserved.
//

import UIKit
import Pulsar

class HomeViewController: UIViewController {
    
    var textArray = [String]()
    var textLevel = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        textArray = ["Papermint","Lemon","Cocoa"]
        textLevel = ["Heavy","Light","Medium"]
        timeInterval = userStartTime

    }
    
    //table
    @IBOutlet weak var mainTable: UITableView!
    var dataSource:NSMutableArray = NSMutableArray()
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    
    @IBOutlet weak var StartStopbnt: CircleButton!
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomerCell
        
        cell.Pname.text = textArray[indexPath.row]
        cell.Plevel.text = textLevel[indexPath.row]
        
        return cell
    }
    
    //timer
    
    @IBOutlet weak var timerLabel: UILabel!
    
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
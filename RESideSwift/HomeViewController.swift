//
//  HomeViewController.swift
//  RESideSwift
//
//  Created by FaiFai on 2/16/2559 BE.
//  Copyright © 2559 FaiFai. All rights reserved.
//

import UIKit
import Pulsar

class HomeViewController: UIViewController {
    
    var textArray = [String]()
    var textLevel = [String]()
//
//    var ScentNameArray = [ChangeScentSection]()
//    var ScentSupportData = [String]()
//    var ScentSupportData02 = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        textArray = ["Papermint","Lemon","Cocoa"]
        textLevel = ["Heavy","Light","Medium"]
        timeInterval = userStartTime
        
//        ScentNameArray = [ChangeScentSection(ScentName: ["N1"] , ScentLevel: ["L1"]),
//                    ChangeScentSection(ScentName: ["N2"] , ScentLevel: ["L2"]),
//                    ChangeScentSection(ScentName: ["N3"] , ScentLevel: ["L3"])]
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
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomerCell
        
        cell.Pname.text = textArray[indexPath.row]
        cell.Plevel.text = textLevel[indexPath.row]
        
        return cell
    }
    
    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        
//        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cell id")
//        
//        if (cell == nil) {
//            cell = MyCustomCell()
//        }
//        
//        (cell as MyCustomCell).label1.text = "Some text"
//        (cell as MyCustomCell).label2.text = "Some text"
//        (cell as MyCustomCell).label3.text = "Some text"
//        
//        return cell;
//    }
    
    

//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
////        let indexPath:NSIndexPath = self.tableView.indexPathForSelectedRow!
//        
////        let DestViewController = segue.destinationViewController as! ChangeScentViewController

////        var ScentNameArray02 : ChangeScentSection
//      
////        ScentNameArray02 = ScentNameArray[indexPath.row]
//     
////        DestViewController.ScenDatatName = ScentNameArray02
//    }
    
    
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

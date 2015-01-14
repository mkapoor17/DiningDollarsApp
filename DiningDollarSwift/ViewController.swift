//
//  ViewController.swift
//  Project 1
//
//  Created by Manav Kapoor on 12/29/14.
//  Copyright (c) 2014 Manav Kapoor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var currentDate: UILabel!
    
    @IBOutlet var balance: UITextField!
    
    @IBOutlet var dailyAllowance: UILabel!
    
    @IBAction func test(sender: AnyObject) {
        
        var todaysDate:NSDate = NSDate()
        var dateFormatter:NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMM-dd-yyyy"
        var DateInFormat:String = dateFormatter.stringFromDate(todaysDate)

        let start = NSDate()
        let end = "Jun-15-2015"
        
        let cal = NSCalendar.currentCalendar()
        let endDate:NSDate = dateFormatter.dateFromString(end)!
        
        let unit:NSCalendarUnit = .DayCalendarUnit
        
        var components = cal.components(unit, fromDate: todaysDate, toDate: endDate, options: nil)
        
        var daysLeft:Double = Double(components.day)
        
        if ((balance.text as NSString).doubleValue > 0.0) {
            var dailyAmount = (balance.text as NSString).doubleValue
            var calc:Double = dailyAmount/daysLeft
            dailyAllowance.text = String(format: "%.02f",calc)
        }
        balance.resignFirstResponder()
        dailyAllowance.resignFirstResponder()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        balance.resignFirstResponder()
        dailyAllowance.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        var todaysDate:NSDate = NSDate()
        var dateFormatter:NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        var DateInFormat:String = dateFormatter.stringFromDate(todaysDate)
        currentDate.text = DateInFormat
        balance.keyboardType = UIKeyboardType.DecimalPad
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


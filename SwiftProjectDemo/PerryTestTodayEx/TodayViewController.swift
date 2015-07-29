//
//  TodayViewController.swift
//  PerryTestTodayEx
//
//  Created by chenzhipeng on 7/29/15.
//  Copyright (c) 2015 PerryChen. All rights reserved.
//

import UIKit
import NotificationCenter
import EmployeeDataProviderKit

class TodayViewController: UIViewController, NCWidgetProviding {
    var provider: EmployeeDataProvider!
    
    @IBOutlet weak var constraintTBheight: NSLayoutConstraint!
    @IBOutlet weak var tbViewContent: UITableView!
    
    @IBAction func btnPressedBtnOne(sender: UIButton) {
        println("aaaa")
        self.extensionContext?.openURL(NSURL(string: "com.perry.today")!, completionHandler: { (complete: Bool) -> Void in
            if complete == true {
                println("aaa")
            }
            
        })
    }
    @IBAction func btnPressedBtnTwo(sender: UIButton) {
        println("bbbb")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        provider = EmployeeDataProvider()
        getAll()
        // Do any additional setup after loading the view from its nib.
    }
    //    /Users/chenzhipeng/Perry/Code/SwiftProjectDemoOneV2/SwiftProjectDemo/PerryTodayEmployees/TodayViewController.swift:11:8: Module file's minimum deployment target is ios8.4 v8.4: /Users/chenzhipeng/Library/Developer/Xcode/DerivedData/SwiftProjectDemo-clkervhfgkwhzgffbwextxmaxgso/Build/Products/Debug-iphoneos/EmployeeDataProviderKit.framework/Modules/EmployeeDataProviderKit.swiftmodule/arm64.swiftmodule
    //    /Users/chenzhipeng/Perry/Code/SwiftProjectDemoOneV2/SwiftProjectDemo/PerryTodayEmployees/TodayViewController.swift:11:8: Could not build Objective-C module 'EmployeeDataProviderKit'
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getAll() {
        
        provider.getAllEmployees({ () -> () in
            println(self.provider.employees)
            self.constraintTBheight.constant = CGFloat(self.provider.employees!.count * 44)
            self.tbViewContent.setNeedsLayout()
            self.tbViewContent.layoutIfNeeded()
            self.tbViewContent.reloadData()
        })
    }
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.NewData)
    }
    
}

extension TodayViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("testCell") as! UITableViewCell
        var forecast = provider.employees![indexPath.row]
        cell.textLabel?.text = forecast.day
        if let temperature = forecast.temperature {
            cell.detailTextLabel?.text = String(temperature)
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if provider.employees != nil {
            return provider.employees!.count
        } else {
            return 0
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(indexPath.row)
    }
}


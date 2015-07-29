//
//  EmployeesListViewController.swift
//  SwiftProjectDemo
//
//  Created by chenzhipeng on 7/29/15.
//  Copyright (c) 2015 PerryChen. All rights reserved.
//

import UIKit
import EmployeeDataProviderKit
class EmployeesListViewController: UIViewController {
    var employees: [Forecast]?
    
    @IBOutlet weak var tbViewContent: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if employees != nil {
            tbViewContent.reloadData()
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension EmployeesListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("testCell") as! UITableViewCell
        var forecast = employees![indexPath.row]
        cell.textLabel?.text = forecast.day
        if let temperature = forecast.temperature {
            cell.detailTextLabel?.text = String(temperature)
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees!.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
}


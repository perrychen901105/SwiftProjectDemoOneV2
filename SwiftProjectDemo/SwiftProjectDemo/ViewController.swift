//
//  ViewController.swift
//  SwiftProjectDemo
//
//  Created by PerryChen on 7/28/15.
//  Copyright (c) 2015 PerryChen. All rights reserved.
//

import UIKit
import EmployeeDataProviderKit

class ViewController: UIViewController {
    var provider: EmployeeDataProvider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        provider = EmployeeDataProvider()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func actionGetAllList(sender: UIButton) {
        getAll()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getAll() {
    
        provider.getAllEmployees({ () -> () in
            println(self.provider.employees)
            self.performSegueWithIdentifier("goList", sender: nil)
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goList" {
            var vcToPush: EmployeesListViewController = segue.destinationViewController as! EmployeesListViewController
            vcToPush.employees = provider.employees
        }
    }
}


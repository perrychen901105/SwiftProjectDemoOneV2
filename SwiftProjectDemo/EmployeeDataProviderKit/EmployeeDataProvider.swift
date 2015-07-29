//
//  EmployeeDataProvider.swift
//  SwiftProjectDemo
//
//  Created by chenzhipeng on 7/29/15.
//  Copyright (c) 2015 PerryChen. All rights reserved.
//

import Foundation

public class EmployeeDataProvider {
    
    public required init() {
        
    }
    
    public var employees: [Forecast]?
    public func getAllEmployees(completion: ()->()){
        EmployeeDataService.sharedInstance.getAllList { (empolyees, error) -> () in
            if let threeDayForecast = empolyees?.threeDayForecast {
                for forecast in threeDayForecast {
//                    println(forecast.day)
//                    println(forecast.temperature)
                }
                self.employees = threeDayForecast
                completion()
            }
        }
    }
    
}


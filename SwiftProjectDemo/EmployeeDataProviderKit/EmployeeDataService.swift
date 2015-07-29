//
//  EmployeeDataService.swift
//  SwiftProjectDemo
//
//  Created by chenzhipeng on 7/29/15.
//  Copyright (c) 2015 PerryChen. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

typealias StatsCompletionBlock = (empolyees: WeatherResponse?, error: NSError?) -> ()

class EmployeeDataService {
    class var sharedInstance: EmployeeDataService {
        struct Singleton {
            static let instance = EmployeeDataService()
        }
        return Singleton.instance
    }
    
    func getAllList(completion: StatsCompletionBlock) {
        let URL = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/d8bb95982be8a11a2308e779bb9a9707ebe42ede/sample_json"
        Alamofire.request(.GET, URL, parameters: nil)
            .responseObject { (response: WeatherResponse?, error: NSError?) in
                println(response?.location)
                completion(empolyees: response, error: nil)
//                if let threeDayForecast = response?.threeDayForecast {
//                    for forecast in threeDayForecast {
//                        println(forecast.day)
//                        println(forecast.temperature)
//                    }
//                }
        }
    }
    
    
}

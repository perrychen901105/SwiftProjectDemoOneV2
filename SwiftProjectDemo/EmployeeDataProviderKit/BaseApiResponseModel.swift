//
//  BaseApiResponseModel.swift
//  SwiftProjectDemo
//
//  Created by PerryChen on 7/29/15.
//  Copyright (c) 2015 PerryChen. All rights reserved.
//

import Foundation
import ObjectMapper

class Employee {
    var firstName: String?
    var lastName: String?
    
    
    
    
}


class WeatherResponse: Mappable {
    var location: String?
    var threeDayForecast: [Forecast]?
    
    class func newInstance() -> Mappable {
        return WeatherResponse()
    }
    
    func mapping(map: Map) {
        location <- map["location"]
        threeDayForecast <- map["three_day_forecast"]
    }
}

public class Forecast: Mappable {
    public var day: String?
    public var temperature: Int?
    public var conditions: String?
    
    public class func newInstance() -> Mappable {
        return Forecast()
    }
    
    public func mapping(map: Map) {
        day <- map["day"]
        temperature <- map["temperature"]
        conditions <- map["conditions"]
    }
}
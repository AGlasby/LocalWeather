//
//  utils.swift
//  LocalWeather
//
//  Created by Alan on 14/07/2016.
//  Copyright © 2016 Alan Glasby. All rights reserved.
//

import Foundation

func roundToPlaces(value: Double, decimalPlaces: Int) -> Double {
    let divisor = pow(10.0, Double(decimalPlaces))
    return round(value * divisor) / divisor
}

func timeConverter(dt: Double) -> String {
    //TimeStamp
    let timeInterval  = dt
    print("time interval is \(timeInterval)")
    
    //Convert to Date
    let date = NSDate(timeIntervalSince1970: timeInterval)
    
    //Date formatting
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "dd, MMMM yyyy HH:mm:a"
    dateFormatter.timeZone = NSTimeZone(name: "UTC")
    let dateString = dateFormatter.stringFromDate(date)
    print("formatted date is =  \(dateString)")
    
    return dateString
}
//
//  Utility.swift
//  Escorsenter
//
//  Created by Francisco Javier Gutierrez Gutierrez on 2/22/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import Foundation

class Utility{
    class func dateFromString(dateString: NSString) -> NSDate?
    {
        var dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm:ss"
        dateFormatter.timeZone = NSTimeZone(abbreviation: "UTC")
        var date = dateFormatter.dateFromString(dateString as String)
        return date
    }
    
    class func stringFromDate(dateString: NSDate) -> String?
    {
        var dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm:ss"
        dateFormatter.timeZone = NSTimeZone(abbreviation: "UTC")
        var date = dateFormatter.stringFromDate(dateString)
        return date
    }
}
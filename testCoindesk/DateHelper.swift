//
//  Date+Formatter.swift
//  testCoindesk
//
//  Created by shrutesh sharma on 25/04/17.
//  Copyright © 2017 Singularity. All rights reserved.
//

import Foundation

/// Helper for date
class DateHelper {
    
    /// Returns the 14 days or two weeks date from the current date
    static var twoWeeksBefore: Date {
        return (Calendar.current as NSCalendar).date(byAdding: .day, value: -14, to: Date(), options: []) ?? Date()
    }
    
    /// Returns today's date
    static func now() -> String {
        return self.stringFromDate(format: "yyyy-MM-dd", date: Date())
    }
    
    /// Static function to return 14 days or two weeks date in `String` from the current date
    static func twoWeekBeforeNow() -> String {
        return self.stringFromDate(format: "yyyy-MM-dd", date: self.twoWeeksBefore)
    }

    /// Returns the string date with the required format
    ///
    /// - Parameters:
    ///   - format: The date format e.g. `"yyyy-MM-dd"`
    ///   - date: The date required to formatted
    /// - Returns: The Date in string
    class func stringFromDate(format: String, date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: date)
    }
    
    
    /// Returns the date from the date string
    ///
    /// - Parameters:
    ///   - format: The date format e.g. `"yyyy-MM-dd"`
    ///   - dateString: The string required to formatted
    /// - Returns: The String in date
    class func dateFromString(format: String, dateString: String) -> Date? {
    
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.date(from: dateString)
    }
}

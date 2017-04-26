//
//  HistoricalRequest.swift
//  testCoindesk
//
//  Created by shrutesh sharma on 24/04/17.
//  Copyright © 2017 Singularity. All rights reserved.
//

import Foundation

class HistoricalRequest: Request {
    
    fileprivate let currency: String
    fileprivate let fromDate: String
    fileprivate let toDate  : String

    
    init(currency: String, fromDate:String, toDate:String) {
        self.currency = currency
        self.fromDate = fromDate
        self.toDate   = toDate
    }
    
    override func httpMethod() -> HTTPMethod {
        return .GET
    }
    
    override func apiVersion() -> String {
        return "/v1"
    }
    
    override func path() -> String {
        return "/bpi/historical/close.json"
    }
    
    override func endPoint() -> String {
        return "?currency=\(currency)&"
    }
    
    override func queryString() -> String {
        return "start=\(self.fromDate)&end=\(self.toDate)"
    }
}

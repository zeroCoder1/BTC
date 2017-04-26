//
//  CurrencyRequest.swift
//  testCoindesk
//
//  Created by shrutesh sharma on 23/04/17.
//  Copyright © 2017 Singularity. All rights reserved.
//

import Foundation

class CurrencyRequest: Request {

    fileprivate let currency: String
    
    init(currency: String) {
        self.currency = currency
    }
    
    override func httpMethod() -> HTTPMethod {
        return .GET
    }
    
    override func apiVersion() -> String {
        return "/v1"
    }
    
    override func path() -> String {
        return "/bpi/currentprice"
    }
    
    override func endPoint() -> String {
        return "/\(currency)"
    }
}

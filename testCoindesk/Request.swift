//
//  Request.swift
//  testCoindesk
//
//  Created by shrutesh sharma on 22/04/17.
//  Copyright © 2017 Singularity. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case GET    = "GET"
    case POST   = "POST"
    case DELETE = "DELETE"
}

class Request {
    func httpMethod() -> HTTPMethod {
        return HTTPMethod.GET
    }
    
    func parameters() -> [String : AnyObject]? {
        return nil
    }
    
    func endPoint() -> String {
        return ""
    }
    
    func apiVersion() -> String {
        return ""
    }
    func path() -> String {
        return ""
    }
    
    func queryString() -> String {
        return ""
    }
}


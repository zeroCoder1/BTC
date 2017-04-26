//
//  TimeParser.swift
//  testCoindesk
//
//  Created by shrutesh sharma on 22/04/17.
//  Copyright © 2017 Singularity. All rights reserved.
//

import Foundation

class TimeParser: Parser {
    
    override func scanObject(_ parsedJson: [String : AnyObject]) -> Any? {
        return Time(json: parsedJson)
    }
}

struct Time {
    
    var updated    : String
    var updatedISO : String
    var updateduk  : String
    
    init(json:[String:AnyObject]) {
        self.updated    = json["updated"] as? String ?? ""
        self.updatedISO = json["updatedISO"] as? String ?? ""
        self.updateduk  = json["updateduk"] as? String ?? ""
    }

}

//
//  HistoricalParser.swift
//  testCoindesk
//
//  Created by shrutesh sharma on 24/04/17.
//  Copyright © 2017 Singularity. All rights reserved.
//

import Foundation



class HistoricalParser: Parser {
    
    var bpi       : [String:Float]?
    var disclaimer: String?
    var time      : Time?
    
    override func scanObject(_ parsedJson: [String : AnyObject]) -> Any? {
        return Historical(json: parsedJson)
    }
}


struct Historical {
    
    var bpi       : [String:Float]
    var disclaimer: String
    var time      : Time
    
    init(json:[String:AnyObject]) {
        self.time       = Time(json: json["time"] as? [String : AnyObject] ?? [:])
        self.bpi        = json["bpi"] as? [String:Float] ?? [:]
        self.disclaimer = json["disclaimer"] as? String ?? ""
    }
}

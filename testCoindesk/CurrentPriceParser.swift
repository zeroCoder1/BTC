//
//  CurrentPrice.swift
//  testCoindesk
//
//  Created by shrutesh sharma on 23/04/17.
//  Copyright © 2017 Singularity. All rights reserved.
//

import Foundation

class CurrentPriceParser: Parser {
    
    var time      : Time?
    var bpi       : BPI?
    var disclaimer: String?
    
    override func scanObject(_ parsedJson: [String : AnyObject]) -> Any? {
        return CurrentPrice(json: parsedJson)
    }
}

struct CurrentPrice {
    
    var time       : Time
    var disclaimer : String
    var bpi        : BPI
    
    init(json:[String:AnyObject]) {
        
        self.time       = Time(json: json["time"] as? [String : AnyObject] ?? [:])
        self.bpi        = BPI(json: json["bpi"] as? [String : AnyObject] ?? [:])
        self.disclaimer = json["disclaimer"] as? String ?? ""
    }
}

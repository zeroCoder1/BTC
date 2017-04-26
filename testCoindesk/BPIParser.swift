//
//  BPIParser.swift
//  testCoindesk
//
//  Created by shrutesh sharma on 23/04/17.
//  Copyright © 2017 Singularity. All rights reserved.
//

import Foundation

class BPIParser: Parser {
    
    override func scanObject(_ parsedJson: [String : AnyObject]) -> Any? {
        return BPI(json: parsedJson)
    }
}

struct BPI {
    
    var eur : Currency?
    var usd : Currency?

    init(json:[String:AnyObject]) {
        self.eur = Currency(json: json["EUR"] as? [String : AnyObject] ?? [:])
        self.usd = Currency(json: json["USD"] as? [String : AnyObject] ?? [:])
    }
}

//
//  CurrencyParser.swift
//  testCoindesk
//
//  Created by shrutesh sharma on 23/04/17.
//  Copyright © 2017 Singularity. All rights reserved.
//

import Foundation


class CurrencyParser: Parser {
    
    override func scanObject(_ parsedJson: [String : AnyObject]) -> Any? {
        return Currency(json: parsedJson)
    }
}

struct Currency {
    var code              : String
    var rate              : String
    var descriptionString : String
    var rateFloat         : Float
    
    init(json:[String:AnyObject]) {
        self.code              = json["code"] as? String ?? ""
        self.rate              = json["rate"] as? String ?? ""
        self.descriptionString = json["description"] as? String ?? ""
        self.rateFloat         = json["rate_float"] as? Float ?? 0.0
    }
}

//
//  Parser.swift
//  testCoindesk
//
//  Created by shrutesh sharma on 22/04/17.
//  Copyright © 2017 Singularity. All rights reserved.
//

import Foundation

class Parser {
    
    fileprivate let data: Data
    
    init(data: Data) {
        self.data = data
    }

    func parse() -> Any? {
        do {            
            let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            
            if let object = object as? [String : AnyObject] {
                return scanObject(object)
            }
        } catch let caught as NSError {
            print(caught.description)
        }
        return nil
    }
    
    // To override. Factory method
    func scanObject(_ parsedJson: [String:AnyObject]) -> Any? {
        return nil
    }
}

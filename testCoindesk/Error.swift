//
//  Error.swift
//  testCoindesk
//
//  Created by shrutesh sharma on 22/04/17.
//  Copyright © 2017 Singularity. All rights reserved.
//

import Foundation

/// Custom Error class.
/// This gets a error message String. Can be sent to a log or display an Alert.
class Error {
    fileprivate let error: NSError?
    
    
    init(error: NSError?) {
        self.error = error
    }
    
    var errorMessage: String? {
        get {
            if let error = error {
                return error.localizedDescription
            }
            return nil
        }
    }
    
    var hasError: Bool {
        get {
            return error != nil
        }
    }
  
}

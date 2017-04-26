//
//  APIClient.swift
//  testCoindesk
//
//  Created by shrutesh sharma on 22/04/17.
//  Copyright © 2017 Singularity. All rights reserved.
//

import Foundation

///Main class the creates a task and hits the API
class APIClient {
    
    fileprivate let mainURL = "https://api.coindesk.com"
    
    func sendRequest(_ request: Request, completionHandler: @escaping (Data?, Error) -> Void) {
        let urlString = "\(mainURL)\(request.apiVersion())\(request.path())\(request.endPoint())\(request.queryString())"
        if let url = URL(string: urlString) {
            var httpRequest = URLRequest(url: url)
            httpRequest.httpMethod = request.httpMethod().rawValue
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: httpRequest, completionHandler: { (data, response, error) in
                DispatchQueue.main.async(execute: {
                    () -> Void in
                    let customError = Error(error: error as NSError?)
                    completionHandler(data, customError)
                })
            })
            task.resume()
        }
    }
}

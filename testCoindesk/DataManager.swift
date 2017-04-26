//
//  DataManager.swift
//  testCoindesk
//
//  Created by shrutesh sharma on 22/04/17.
//  Copyright © 2017 Singularity. All rights reserved.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    fileprivate let apiClient = APIClient()
    
    func fetchCurrenPriceFor(_ currency: Coindesk, completion: @escaping (CurrentPrice?, Error?) -> ()) {
        let request = CurrencyRequest(currency: currency.rawValue)
        self.apiClient.sendRequest(request) { (data, error) in
            if let data = data {
                if let currentPrice = CurrentPriceParser(data:data).parse() as? CurrentPrice {
                completion(currentPrice, Error(error: nil))
                }
            } else {
                completion(nil, error)
            }
        }
    }
    
    func fetchHistoricalRequest(_ currency: Coindesk, fromDate: String, toDate: String, completion: @escaping (Historical?,Error?) -> ()) {
        let request = HistoricalRequest(currency: currency.rawValue, fromDate: fromDate, toDate: toDate)
        self.apiClient.sendRequest(request) { (data, error) in
            if let data = data {
                if let historical = HistoricalParser(data:data).parse() as? Historical {
                    completion(historical, Error(error: nil))
                }
            } else {
                completion(nil, error)
                
            }
        }
    }
}


enum Coindesk: String {
    case Euro        = "EUR"
    case Dollar      = "USD"
    case ChineseYuan = "CNY"
    case Rupee       = "INR"
}

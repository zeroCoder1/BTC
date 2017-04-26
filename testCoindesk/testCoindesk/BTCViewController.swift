//
//  BTCViewController.swift
//  testCoindesk
//
//  Created by shrutesh sharma on 26/04/17.
//  Copyright © 2017 Singularity. All rights reserved.
//

import UIKit

class BTCViewController: UIViewController {

    @IBOutlet weak var currentPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataManager.shared.fetchCurrenPriceFor(.Euro) { (currentPrice, error) in
            if let currentPrice = currentPrice {
                self.currentPriceLabel.text = String(format:"%.2f",(currentPrice.bpi.eur?.rateFloat)!)
            }
        }
    }
}

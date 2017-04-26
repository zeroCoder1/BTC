//
//  ViewController.swift
//  testCoindesk
//
//  Created by shrutesh sharma on 22/04/17.
//  Copyright © 2017 Singularity. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TransitionAnimatorDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var refresh: UIBarButtonItem!
    
    var dataSource = [(key: String, value: Float)]()
    
    let transitionAnimator = TransitionAnimator()

    // MARK: Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.register(UINib(nibName:"CurrencyCell", bundle: nil), forCellReuseIdentifier: "CurrencyCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.isHidden = true
        
        self.refreshActn()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    /// Sorts the keys i.e Dates
    ///
    /// - Parameter historical: Takes in historical model
    func sortKeys(historical:Historical) {
        let array = historical.bpi.sorted{
            guard let d1 = DateHelper.dateFromString(format: "yyyy-MM-dd", dateString: $0.key), let d2 = DateHelper.dateFromString(format: "yyyy-MM-dd", dateString: $1.key) else { return false }
            return d1 > d2
        }
        self.dataSource = array
        
        // reload the table
        self.tableView.reloadData()
        self.tableView.isHidden = false
    }
    
    
    @IBAction func refreshActn() {
    
        self.dataSource = [(key: "", value: 0)]
        DataManager.shared.fetchHistoricalRequest(.Euro, fromDate: DateHelper.twoWeekBeforeNow(), toDate: DateHelper.now()) { (historical, error) in
            
            if let historical = historical {
                self.sortKeys(historical: historical)
            }
        }
    }
    
    @IBAction func unwindToHome(_ segue: UIStoryboardSegue) {
        let _ = segue.source as? BTCViewController
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let btcViewController = segue.destination as? BTCViewController
        btcViewController?.transitioningDelegate = self.transitionAnimator
        self.transitionAnimator.delegate = self
    }
    
    func dismiss() {
        
    }
}

// MARK: Table Datasource

extension ViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}

// MARK: Table Delegates

extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell", for: indexPath) as! CurrencyCell
        
        cell.currencyLabel?.text = String(format: "%.2f", self.dataSource[indexPath.row].value)
        cell.dateLabel?.text = self.dataSource[indexPath.row].key
        
        return cell
    }

}


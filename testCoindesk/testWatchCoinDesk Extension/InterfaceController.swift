//
//  InterfaceController.swift
//  testWatchCoinDesk Extension
//
//  Created by shrutesh sharma on 26/04/17.
//  Copyright © 2017 Singularity. All rights reserved.
//

import WatchKit
import Foundation

struct RowData {
    let name: String
    let imageName: String
}


class InterfaceController: WKInterfaceController {

    @IBOutlet var table: WKInterfaceTable!
    var dataSource = [(key: String, value: Float)]()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)

        DataManager.shared.fetchHistoricalRequest(.Euro, fromDate: DateHelper.twoWeekBeforeNow(), toDate: DateHelper.now()) { (historical, error) in
            if let historical = historical {
                self.sortKeys(historical: historical)
            }
        }
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
        self.reloadTable()
    }
    
    
    func reloadTable() {
        self.table.setNumberOfRows(self.dataSource.count, withRowType: "Row")
        
        let rows = Array(repeating: "Row", count: self.dataSource.count)
        table.setRowTypes(rows)
        
        for i in 0 ..< self.dataSource.count {
            let object = dataSource[i];
            if let row = table.rowController(at: i) as? TableRow {
                row.dateLabel.setText(object.key)
                row.rateLabel.setText(String(object.value))
            }
        }
    }
    
    override func willActivate() {
        super.willActivate()
        
     
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

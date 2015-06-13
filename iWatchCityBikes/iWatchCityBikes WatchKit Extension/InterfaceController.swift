//
//  InterfaceController.swift
//  iWatchCityBikes WatchKit Extension
//
//  Created by Arkadiusz Banaś on 13/06/15.
//  Copyright (c) 2015 SwiftHackaton. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var tableView: WKInterfaceTable!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        
        self.loadItems()
        
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func loadItems() {
        
        var station1 = Station()
        station1.name = "Plac Kościuszki"
        station1.availableBikesCount = 5
        station1.availableLocksCount = 3
        
        var station2 = Station()
        station2.name = "Plac Rodłą"
        station2.availableBikesCount = 15
        station2.availableLocksCount = 3
        
        var station3 = Station()
        station3.name = "Jasne Błonia"
        station3.availableBikesCount = 6
        station3.availableLocksCount = 8

        let stations:[Station] = [station1, station2, station3]
        
        
        // update table view 
        self.tableView.setNumberOfRows(stations.count, withRowType: "standard");

        for (index, station:Station) in enumerate(stations) {
            var cell:WatchTableCell = self.tableView.rowControllerAtIndex(index) as! WatchTableCell
            cell.stationNameLabel.setText(station.name)
            cell.bieksCountLabel.setText("W. rowerów: " + String(station.availableBikesCount))
            cell.freeStandCountLabel.setText("W. zamków: " + String(station.availableLocksCount))
        }
        
    }
}

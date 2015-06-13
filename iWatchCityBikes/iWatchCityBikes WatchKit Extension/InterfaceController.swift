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
        
        NetworkManager.getData { stations in
            // update table view
            self.tableView.setNumberOfRows(stations.count, withRowType: "standard");
            
            for (index, station:Station) in enumerate(stations as! [Station]) {
                var cell:WatchTableCell = self.tableView.rowControllerAtIndex(index) as! WatchTableCell
                cell.stationNameLabel.setText(station.name)
                cell.bieksCountLabel.setText("W. rowerów: " + String(station.availableBikesCount))
                cell.freeStandCountLabel.setText("W. zamków: " + String(station.availableLocksCount))
            }
        }
    }
}

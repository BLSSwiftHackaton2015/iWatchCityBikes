//
//  InterfaceController.swift
//  iWatchCityBikes WatchKit Extension
//
//  Created by Arkadiusz Banaś on 13/06/15.
//  Copyright (c) 2015 SwiftHackaton. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController, CLLocationManagerDelegate {
    
    @IBOutlet weak var tableView: WKInterfaceTable!
    
    var stations:[Station]! = []
    var lastLocation:CLLocation?
    let locationManager =  CLLocationManager()
    
    override func willActivate() {
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        self.locationManager.activityType = CLActivityType.OtherNavigation
        self.locationManager.distanceFilter = 5
        
        var status:CLAuthorizationStatus = CLLocationManager.authorizationStatus()
        if status == .AuthorizedAlways || status == .AuthorizedWhenInUse {
            self.locationManager.startUpdatingLocation()
        }
        
        super.willActivate()
    }
    
    func loadItems() {
        
        NetworkManager.getData { tempStations in
            
            self.stations = GPSPositionSorter.sortStations(tempStations as! [Station], userPos: self.lastLocation!.coordinate)
            if self.stations.count > 3 {
                self.stations.removeRange(Range(start:3, end:self.stations.count))
            }
            
            
            // update table view
            self.tableView.setNumberOfRows(self.stations.count, withRowType: "standard");
            
            for (index, station:Station) in enumerate(self.stations) {
                var cell:WatchTableCell = self.tableView.rowControllerAtIndex(index) as! WatchTableCell
                cell.stationNameLabel.setText(station.name)
                cell.bieksCountLabel.setText("W. rowerów: " + String(station.availableBikesCount))
                cell.freeStandCountLabel.setText("W. zamków: " + String(station.availableLocksCount))
            }
        }
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
        return self.stations[rowIndex]
    }
    
    // MARK: CLLocationManagerDelegate
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        self.lastLocation = locations.last as? CLLocation
        loadItems()
    }
}

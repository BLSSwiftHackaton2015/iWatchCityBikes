//
//  MapInterfaceController.swift
//  iWatchCityBikes
//
//  Created by Arkadiusz Banaś on 13/06/15.
//  Copyright (c) 2015 SwiftHackaton. All rights reserved.
//

import WatchKit

class MapInterfaceController: WKInterfaceController {

    @IBOutlet weak var map: WKInterfaceMap!
    
    override func awakeWithContext(context: AnyObject?) {
        let station = context as! Station
        let region = MKCoordinateRegion(center: station.location, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        self.map.setRegion(region)
        self.map.addAnnotation(station.location, withPinColor: WKInterfaceMapPinColor.Green)

    }
    
}

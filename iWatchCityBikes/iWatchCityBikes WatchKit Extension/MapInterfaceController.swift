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
    
    override func willActivate() {
        let location = CLLocationCoordinate2D(latitude: 40.7000000, longitude: -111.0000000)
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        self.map.setRegion(region)
    }
}

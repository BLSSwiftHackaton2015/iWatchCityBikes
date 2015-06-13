//
//  Station.swift
//  iWatchCityBikes
//
//  Created by Arkadiusz Banaś on 13/06/15.
//  Copyright (c) 2015 SwiftHackaton. All rights reserved.
//

import Foundation
import CoreLocation

class Station {
    var name: String = ""
    var availableBikesCount: Int = 0
    var availableLocksCount: Int = 0
    var location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    init(){}
    
    init(dictionary : NSDictionary){
        self.name = dictionary["LocalTitle"] as! String!
        self.availableBikesCount = dictionary["AvailableBikesCount"] as! Int!
        self.availableLocksCount = dictionary["FreeLocksCount"] as! Int!
        let longitude = dictionary["Longitude"] as! Double!
        let latitude = dictionary["Latitude"] as! Double!
        self.location = CLLocationCoordinate2DMake(latitude as CLLocationDegrees, longitude as CLLocationDegrees)
    }
}
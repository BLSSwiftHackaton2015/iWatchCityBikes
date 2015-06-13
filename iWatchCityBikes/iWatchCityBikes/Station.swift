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
    var location: CLLocationCoordinate2D
    
    init(dictionary : NSDictionary){
        self.name = dictionary["LocalTitle"] as! String!
        self.availableBikesCount = dictionary["LocalTitle"] as! Int!
        self.availableLocksCount = dictionary["LocalTitle"] as! Int!
        let longitude = dictionary["LocalTitle"] as! Double!
        let latitude = dictionary["LocalTitle"] as! Double!
        self.location = CLLocationCoordinate2DMake(latitude as CLLocationDegrees, longitude as CLLocationDegrees)
    }
}
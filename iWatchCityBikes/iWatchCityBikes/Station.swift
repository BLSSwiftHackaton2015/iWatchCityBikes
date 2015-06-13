//
//  Station.swift
//  iWatchCityBikes
//
//  Created by Arkadiusz Banaś on 13/06/15.
//  Copyright (c) 2015 SwiftHackaton. All rights reserved.
//

import Foundation
import CoreLocation

struct Station {
    var name: String
    var availableBikesCount: Int
    var availableLocksCount: Int
    var location: CLLocation
}
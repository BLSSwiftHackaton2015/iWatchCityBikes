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
    var location: CLLocation?
}
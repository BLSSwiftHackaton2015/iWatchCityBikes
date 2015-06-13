//
//  GPSPositionSorter.swift
//  iWatchCityBikes
//
//  Created by user on 13/06/15.
//  Copyright (c) 2015 SwiftHackaton. All rights reserved.
//

import UIKit
import CoreLocation

class GPSPositionSorter: NSObject {
    class func distance(s1: CLLocationCoordinate2D, _ s2: CLLocationCoordinate2D) -> Double {
        return sqrt( (s1.latitude-s2.latitude)*(s1.latitude-s2.latitude)
            + (s1.longitude-s2.longitude)*(s1.longitude-s2.longitude) )
    }
    
    class func sortPositions(positions:[CLLocationCoordinate2D] , userPos:CLLocationCoordinate2D) -> [CLLocationCoordinate2D] {
        var pomTab = positions
        pomTab.sort { s1, s2 in
            return self.distance(userPos, s1) > self.distance(userPos, s2)
        }
        return pomTab

    }
}

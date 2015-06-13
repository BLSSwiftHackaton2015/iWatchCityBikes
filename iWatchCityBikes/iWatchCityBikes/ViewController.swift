//
//  ViewController.swift
//  iWatchCityBikes
//
//  Created by Arkadiusz Banaś on 13/06/15.
//  Copyright (c) 2015 SwiftHackaton. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.locationManager.requestAlwaysAuthorization()
    }
}


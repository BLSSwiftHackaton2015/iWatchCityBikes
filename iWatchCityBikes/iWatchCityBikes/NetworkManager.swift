//
//  NetworkManager.swift
//  iWatchCityBikes
//
//  Created by user on 13/06/15.
//  Copyright (c) 2015 SwiftHackaton. All rights reserved.
//

import UIKit

class NetworkManager: NSObject {
    class func getData() {
        let baseURL =  NSURL(string: "https://www.bikes-srm.pl/LocationsMap.aspx")
        let task = NSURLSession.sharedSession().dataTaskWithURL(baseURL!) {(data, response, error) in
            println(NSString(data: data, encoding: NSUTF8StringEncoding))
        }
        
        task.resume()
    }
    
    private func parse(NSString inputPage){
//        var str = inputPage
//        let pos = str.rangeOfString("var mapDataLocations = ")
//        jsonStr = inputPage.
        
    }
}

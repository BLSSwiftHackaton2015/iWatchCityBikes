//
//  NetworkManager.swift
//  iWatchCityBikes
//
//  Created by user on 13/06/15.
//  Copyright (c) 2015 SwiftHackaton. All rights reserved.
//

import UIKit
import Foundation

class NetworkManager: NSObject {
    class func getData(completion: NSArray -> Void) {
        let baseURL =  NSURL(string: "https://www.bikes-srm.pl/LocationsMap.aspx")
        let task = NSURLSession.sharedSession().dataTaskWithURL(baseURL!) {(data, response, error) in
            //println(NSString(data: data, encoding: NSUTF8StringEncoding))
            let tab = self.parse(NSString(data: data, encoding: NSUTF8StringEncoding)!)
            var stationArray = NSMutableArray()
            
            for station : AnyObject in tab {
                let st : NSDictionary = station as! NSDictionary
                let st1 = Station(dictionary: st)
                stationArray.addObject(st1)
                //println(st1)
            }
            
            completion(stationArray)
        }
        
        task.resume()
    }
    
    private class func parse(inputPage: NSString) -> NSArray {
        //var str = inputPage
        //let pos = str.rangeOfString()
        let jsonStr1:NSString = inputPage.componentsSeparatedByString("var mapDataLocations = ")[1] as! NSString
        let jsonStr2:NSString = jsonStr1.componentsSeparatedByString(";")[0] as! NSString
        //println(jsonStr2)
        
        var jsonError:NSError?
        let jsonData = jsonStr2.dataUsingEncoding(NSUTF8StringEncoding);
        let json = NSJSONSerialization.JSONObjectWithData(jsonData!, options: nil, error: &jsonError) as! NSArray
        
        if let unwrappedError = jsonError {
            println(unwrappedError)
        }
        
        return json
        
    }
}

//
//  RaceController.swift
//  F1Results
//
//  Created by Mike Gilroy on 06/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import Foundation
import UIKit

class RaceController {
    
    static let sharedInstance = RaceController()
    
    
    var races: [Race] = []
    
    let racesURL = "http://ergast.com/api/f1/current/results.json?limit=600"
    let driverStandingsURL = "http://ergast.com/api/f1/current/driverStandings.json"

    
    static func getRaces(completion: (racesArray: [Race]?) -> Void) {
        
        let racesUrl = NSURL(string: "http://ergast.com/api/f1/current/results.json?limit=600")!
        
        NetworkController.dataAtURL(racesUrl) { (data) -> Void in
            
            guard let data = data else { completion(racesArray: nil); return }
            
            do {
                if let jsonData = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? [String: AnyObject] {
                    
                    if let MRDataDictionary = jsonData["MRData"] as? [String: AnyObject] {
                        
                        if let raceTableDictionary = MRDataDictionary["RaceTable"] as? [String: AnyObject] {
                            
                            if let racesArrayDicts = raceTableDictionary["Races"] as? [[String: AnyObject]] {
                                
                                var racesArray: [Race] = []
                                
                                for race in racesArrayDicts {
                                     
                                    // init Race object with name, circuit, round
                                    let raceObject = Race(jsonDictionary: race)
                                    
                                    // append race to racesArray
                                    racesArray.append(raceObject)
                                }
                                RaceController.sharedInstance.races = racesArray
                                completion(racesArray: racesArray)
                                
                            } else {
                                completion(racesArray: nil)
                                print("No races array found")
                            }
                        } else {
                            print("No raceTable found")
                            completion(racesArray: nil)
                        }
                    } else {
                        completion(racesArray: nil)
                        print("No MRData found")
                    }
                } else {
                    completion(racesArray: nil)
                }
            } catch {
                completion(racesArray: nil)
                print("Error getting json data")
            }
        }
    }
    
    
    static func flageImageFromString(raceName: String) -> UIImage {
        let raceName = raceName.lowercaseString
        if raceName.containsString("australia") {
            return UIImage(named: "Australia")!
        } else if raceName.containsString("british") {
            return UIImage(named: "United-Kingdom")!
        } else if raceName.containsString("german") {
            return UIImage(named: "Germany")!
        } else if raceName.containsString("malaysia") {
            return UIImage(named: "Malaysia")!
        } else if raceName.containsString("monaco") {
            return UIImage(named: "Monaco")!
        } else if raceName.containsString("spanish") {
            return UIImage(named: "Spain")!
        } else if raceName.containsString("chinese") {
            return UIImage(named: "China")!
        } else if raceName.containsString("canadian") {
            return UIImage(named: "Canada")!
        } else if raceName.containsString("bahrain") {
            return UIImage(named: "Bahrain")!
        } else if raceName.containsString("austrian") {
            return UIImage(named: "Austria")!
        } else if raceName.containsString("hungarian") {
            return UIImage(named: "Hungary")!
        } else if raceName.containsString("belgian") {
            return UIImage(named: "Belgium")!
        } else if raceName.containsString("italian") {
            return UIImage(named: "Italy")!
        } else if raceName.containsString("singapore") {
            return UIImage(named: "Singapore")!
        } else if raceName.containsString("japanese") {
            return UIImage(named: "Japan")!
        } else if raceName.containsString("russian") {
            return UIImage(named: "Russia")!
        } else if raceName.containsString("states") {
            return UIImage(named: "United-States")!
        } else if raceName.containsString("mexican") {
            return UIImage(named: "Mexico")!
        } else if raceName.containsString("dhabi") {
            return UIImage(named: "United-Arab-Emirates")!
        } else if raceName.containsString("brazil") {
            return UIImage(named: "Brazil")!
        } else {
            return UIImage(named: "United-Kingdom")!
        }
    }
    
}
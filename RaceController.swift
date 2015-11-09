//
//  RaceController.swift
//  F1Results
//
//  Created by Mike Gilroy on 06/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import Foundation

class RaceController {
    
    
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
    
}
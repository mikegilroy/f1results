//
//  DriverStandingsController.swift
//  F1Results
//
//  Created by Mike Gilroy on 08/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import Foundation

class DriverStandingsController {
    
    var driverStandingsArray: [DriverStanding] = []
    
    let driverStandingsURL = "http://ergast.com/api/f1/current/driverStandings.json"
    
    
    static func getDriverStandings(completion: (driverStandingsArray: [DriverStanding]?) -> Void) {
        
        let racesUrl = NSURL(string: "http://ergast.com/api/f1/current/driverStandings.json")!
        
        NetworkController.dataAtURL(racesUrl) { (data) -> Void in
            
            guard let data = data else { completion(driverStandingsArray: nil); return }
            
            do {
                if let jsonData = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? [String: AnyObject] {
                    
                    if let MRDataDictionary = jsonData["MRData"] as? [String: AnyObject] {
                        
                        if let standingsTableDictionary = MRDataDictionary["StandingsTable"] as? [String: AnyObject] {
                            
                            if let standingsTableArray = standingsTableDictionary["StandingsLists"] as? [[String: AnyObject]] {
                                
                                let standingsDictionary = standingsTableArray[0]
                                
                                if let driverStandingsArray = standingsDictionary["DriverStandings"] as? [[String: AnyObject]] {
                                    
                                    var standingsArray: [DriverStanding] = []
                                    
                                    for driver in driverStandingsArray {
                                        
                                        // init Race object with name, circuit, round
                                        let driverStandingObject = DriverStanding(jsonDictionary: driver)
                                        
                                        // append race to racesArray
                                        standingsArray.append(driverStandingObject)
                                    }
                                    
                                    completion(driverStandingsArray: standingsArray)
                                    
                                } else {
                                    completion(driverStandingsArray: nil)
                                    print("No Driver Standings array")
                                }
                                
                            } else {
                                print("No raceTable found")
                                completion(driverStandingsArray: nil)
                            }
                        } else {
                            print("No Standings table")
                            completion(driverStandingsArray: nil)
                        }
                    } else {
                        completion(driverStandingsArray: nil)
                        print("No MRData found")
                    }
                } else {
                    completion(driverStandingsArray: nil)
                }
            } catch {
                completion(driverStandingsArray: nil)
                print("Error getting json data")
            }
        }
    }

    
}
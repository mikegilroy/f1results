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
    
    static func getRaces(completion: (racesArray: [Race]?) -> Void) {
        
        let racesUrl = NetworkController.searchURL()
        
        NetworkController.dataAtURL(racesUrl) { (data) -> Void in
            
            guard let data = data else { completion(racesArray: nil); return }
            
            do {
                if let jsonData = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? [String: AnyObject] {
                    
                    if let MRDataDictionary = jsonData["MRData"] as? [String: AnyObject] {
                        
                        if let raceTableDictionary = MRDataDictionary["RaceTable"] as? [String: AnyObject] {
                            
                            if let racesArrayDicts = raceTableDictionary["Races"] as? [[String: AnyObject]] {
                                
                                var racesArray: [Race] = []
                                
                                for race in racesArrayDicts {
                                    
//                                    // get round number
//                                    let roundNumberString = race["round"] as! String
//                                    let roundNumber = Int(roundNumberString)!
//                                    
//                                    // get race name
//                                    let raceName = race["raceName"] as! String
//                                    
//                                    // get circuit name
//                                    let circuitDict = race["Circuit"] as! [String: AnyObject]
//                                    let circuitName = circuitDict["circuitName"] as! String
                
                                    
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
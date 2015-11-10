//
//  ConstructorStandingsController.swift
//  F1Results
//
//  Created by Mike Gilroy on 09/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import Foundation

class  ConstructorStandingsController {
    
    var constructorStandingsArray: [ConstructorStanding] = []
    
    let constructorStandingsURLString = "http://ergast.com/api/f1/current/constructorStandings.json"
    
    
    static func getDriverStandings(completion: (constructorStandingsArray: [ConstructorStanding]?) -> Void) {
        
        let constructorStandingsURL = NSURL(string: "http://ergast.com/api/f1/current/constructorStandings.json")!
        
        NetworkController.dataAtURL(constructorStandingsURL) { (data) -> Void in
            
            guard let data = data else { completion(constructorStandingsArray: nil); return }
            
            do {
                if let jsonData = try NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments) as? [String: AnyObject] {
                    
                    if let MRDataDictionary = jsonData["MRData"] as? [String: AnyObject] {
                        
                        if let standingsTableDictionary = MRDataDictionary["StandingsTable"] as? [String: AnyObject] {
                            
                            if let standingsTableArray = standingsTableDictionary["StandingsLists"] as? [[String: AnyObject]] {
                                
                                let standingsDictionary = standingsTableArray[0]
                                
                                if let constructorStandingsArray = standingsDictionary["ConstructorStandings"] as? [[String: AnyObject]] {
                                    
                                    var standingsArray: [ConstructorStanding] = []
                                    
                                    for constructor in constructorStandingsArray {
                                        
                                        // init Race object with name, circuit, round
                                        let constructorStandingObject = ConstructorStanding(jsonDictionary: constructor)
                                        
                                        // append race to racesArray
                                        standingsArray.append(constructorStandingObject)
                                    }
                                    
                                    completion(constructorStandingsArray: standingsArray)
                                    
                                } else {
                                    completion(constructorStandingsArray: nil)
                                    print("No Driver Standings array")
                                }
                                
                            } else {
                                print("No raceTable found")
                                completion(constructorStandingsArray: nil)
                            }
                        } else {
                            print("No Standings table")
                            completion(constructorStandingsArray: nil)
                        }
                    } else {
                        completion(constructorStandingsArray: nil)
                        print("No MRData found")
                    }
                } else {
                    completion(constructorStandingsArray: nil)
                }
            } catch {
                completion(constructorStandingsArray: nil)
                print("Error getting json data")
            }
        }
    }
    
}
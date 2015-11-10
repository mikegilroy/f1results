//
//  ConstructorStandingsController.swift
//  F1Results
//
//  Created by Mike Gilroy on 09/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import Foundation
import UIKit

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
    
    static func flageImageFromStanding(standing: ConstructorStanding) -> UIImage {
        let nationality = standing.nationality.lowercaseString
        if nationality.containsString("british") {
            return UIImage(named: "United-Kingdom")!
        } else if nationality.containsString("german") {
            return UIImage(named: "Germany")!
        } else if nationality.containsString("italian") {
            return UIImage(named: "Italy")!
        } else if nationality.containsString("indian") {
            return UIImage(named: "India")!
        } else if nationality.containsString("austrian") {
            return UIImage(named: "Austria")!
        } else {
            return UIImage(named: "India")!
        }
    }
    
    static func teamIconFromConstructorStanding(standing: ConstructorStanding) -> UIImage {
        let team = standing.teamName.lowercaseString
        if team.containsString("merc") {
            return UIImage(named: "driverResultTeamIcon-MERCEDES")!
        } else if team.containsString("red") {
            return UIImage(named: "driverResultTeamIcon-REDBULL")!
        } else if team.containsString("sauber") {
            return UIImage(named: "driverResultTeamIcon-SAUBER")!
        } else if team.containsString("ferrari") {
            return UIImage(named: "driverResultTeamIcon-FERRARI")!
        } else if team.containsString("mclaren") {
            return UIImage(named: "driverResultTeamIcon-MCLAREN")!
        } else if team.containsString("toro") {
            return UIImage(named: "driverResultTeamIcon-TOROROSSO")!
        } else if team.containsString("williams") {
            return UIImage(named: "driverResultTeamIcon-WILLIAMS")!
        } else if team.containsString("marussia") {
            return UIImage(named: "driverResultTeamIcon-MARUSSIA")!
        } else {
            return UIImage(named: "driverResultTeamIcon-LOTUS")!
        }
    }
    
    static func teamLogoFromConstructorStanding(standing: ConstructorStanding) -> UIImage {
        let team = standing.teamName.lowercaseString
        if team.containsString("merc") {
            return UIImage(named: "logoMercedes")!
        } else if team.containsString("red") {
            return UIImage(named: "logoRedBull")!
        } else if team.containsString("sauber") {
            return UIImage(named: "logoSauber")!
        } else if team.containsString("ferrari") {
            return UIImage(named: "logoFerrari")!
        } else if team.containsString("mclaren") {
            return UIImage(named: "logoMclaren")!
        } else if team.containsString("toro") {
            return UIImage(named: "logoToroRosso")!
        } else if team.containsString("williams") {
            return UIImage(named: "logoWilliams")!
        } else if team.containsString("india") {
            return UIImage(named: "logoForceIndia")!
        } else {
            return UIImage(named: "logoLotus")!
        }
    }
    
    static func teamCarFromConstructorStanding(standing: ConstructorStanding) -> UIImage {
        let team = standing.teamName.lowercaseString
        if team.containsString("merc") {
            return UIImage(named: "carMercedes")!
        } else if team.containsString("red") {
            return UIImage(named: "carRedBull")!
        } else if team.containsString("sauber") {
            return UIImage(named: "carSauber")!
        } else if team.containsString("ferrari") {
            return UIImage(named: "carFerrari")!
        } else if team.containsString("mclaren") {
            return UIImage(named: "carMclaren")!
        } else if team.containsString("toro") {
            return UIImage(named: "carToroRosso")!
        } else if team.containsString("williams") {
            return UIImage(named: "carWilliams")!
        } else if team.containsString("lotus") {
            return UIImage(named: "carLotus")!
        } else if team.containsString("india") {
            return UIImage(named: "carForceIndia")!
        } else {
            return UIImage(named: "carMarussia")!
        }
    }
    
}
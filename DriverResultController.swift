//
//  DriverResultController.swift
//  F1Results
//
//  Created by Mike Gilroy on 06/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import Foundation

class DriverResultController {
    
    var resultsArray: [RaceResult] = []
    
    static func getDriverResultsArray(race: Race) -> [RaceResult] {
        
        // for each driver result in race results array, initialize DriverResult and add to array
        var resultsArray: [RaceResult] = []
        
        for driverResult in race.raceResultsArray {
            resultsArray.append(RaceResult(jsonDictionary: driverResult))
        }
        return resultsArray
    }
}
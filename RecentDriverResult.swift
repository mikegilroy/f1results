//
//  RecentDriverResult.swift
//  F1Results
//
//  Created by Mike Gilroy on 15/12/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import Foundation

class RecentDriverResult {
    
    var race: String = ""
    var position: Int = 0
    var points: String = ""
    var status: String = ""
    var roundNumber: Int = 0
    
    init(race: Race, driverCode: String) {
        for result in race.raceResultsArray {
            let raceResult = RaceResult(jsonDictionary: result)
            if raceResult.driverCode == driverCode {
                self.race = race.raceName
                self.position = raceResult.position
                self.points = raceResult.points
                self.status = raceResult.status
                self.roundNumber = race.roundNumber
            }
        }
    }
    
}
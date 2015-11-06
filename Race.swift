//
//  Race.swift
//  F1Results
//
//  Created by Mike Gilroy on 06/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import Foundation

class Race {
    
    let raceNameKey = "raceName"
    let roundNumberKey = "round"
    let circuitNameKey = "circuitName"
    
    var raceName: String
    var roundNumber: Int
    var circuitName: String
    var raceResultsArray: [[String: AnyObject]]

    init(jsonDictionary: [String: AnyObject]) {
        let roundNumberString = jsonDictionary[roundNumberKey] as! String
        let roundNumber = Int(roundNumberString)!
        
        let raceName = jsonDictionary[raceNameKey] as! String
        
        let circuitDictionary = jsonDictionary["Circuit"] as! [String: AnyObject]
        let circuitName = circuitDictionary[circuitNameKey] as! String
        
        let raceResultsArray = jsonDictionary["Results"] as! [[String: AnyObject]]
        
        self.raceName = raceName
        self.roundNumber = roundNumber
        self.circuitName = circuitName
        self.raceResultsArray = raceResultsArray
    }
    
    
}
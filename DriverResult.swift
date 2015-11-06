//
//  Driver.swift
//  F1Results
//
//  Created by Mike Gilroy on 06/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import Foundation

class DriverResult {
    
    let firstNameKey = "givenName"
    let lastNameKey = "familyName"
    let positionKey = "position"
    let driverCodeKey = "code"
    let nationalityKey = "nationality"
    let statusKey =  "status"
    let gridPositionKey = "grid"
    let carNumberKey = "permanentNumber"
    let lapsKey = "laps"
    let finalTimeKey = "time"
    let fastestLapRankKey = "rank"
    let fastestLapNumberKey = "lap"
    let fastestLapTimeKey = "time"
    let driverURLStringKey = "url"
    let dateOfBirthKey = "dateOfBirth"
    let pointsKey = "points"
    let teamNameKey = "name"
    
    var firstName: String
    var lastName: String
    var fullName: String {
        return firstName + " " + lastName
    }
    var position: Int
    var points: String
    var driverCode: String
    var nationality: String
    var status: String
    var gridPosition: String
    var carNumber: String
    var laps: String
    var finalTime: String?
    var fastestLapRank: Int?
    var fastestLapNumber: String?
    var fastestLapTime: String?
    var driverURLString: String
    var dateOfBirth: String
    var teamName: String
    
    
    init(jsonDictionary: [String: AnyObject]) {
     
        // Get data from main jsonDictionary
        let positionString = jsonDictionary[positionKey] as! String
        let position = Int(positionString)!
        let points = jsonDictionary[pointsKey] as! String
        let gridPosition = jsonDictionary[gridPositionKey] as! String
        let laps = jsonDictionary[lapsKey] as! String
        let status = jsonDictionary[statusKey] as! String
        
        // Get data from sub dictionary of: Driver
        let driverDictionary = jsonDictionary["Driver"] as! [String: AnyObject]
        
        let firstName = driverDictionary[firstNameKey] as! String
        let lastName = driverDictionary[lastNameKey] as! String
        let carNumber = driverDictionary[carNumberKey] as! String
        let driverCode = driverDictionary[driverCodeKey] as! String
        let driverURLString = driverDictionary[driverURLStringKey] as! String
        let nationality = driverDictionary[nationalityKey] as! String
        let dateOfBirth = driverDictionary[dateOfBirthKey] as! String
        
        // Get data from sub dictionary of: Constructor
        let constructorDictionary = jsonDictionary["Constructor"] as! [String: AnyObject]
        let teamName = constructorDictionary[teamNameKey] as! String
        
        // Get data from sub dictionary of: Time
        let timeDictionary = jsonDictionary["Time"] as? [String: AnyObject]
        if let timeDictionary = timeDictionary {
            let finalTime = timeDictionary[finalTimeKey] as! String
            self.finalTime = finalTime
        } else {
            self.finalTime = nil
        }
        
        // Get data from sub dictionary of: Fastest Lap
        if let fastestLapDictionary = jsonDictionary["FastestLap"] as? [String: AnyObject] {
        let fastestLapRankString = fastestLapDictionary[fastestLapRankKey] as! String
        let fastestLapRank = Int(fastestLapRankString)!
        let fastestLapNumber = fastestLapDictionary[fastestLapNumberKey] as! String
        let fastestLapTimeDictionary = fastestLapDictionary["Time"] as! [String: AnyObject]
        let fastestLapTime = fastestLapTimeDictionary[fastestLapTimeKey] as! String
            
            self.fastestLapRank = fastestLapRank
            self.fastestLapNumber = fastestLapNumber
            self.fastestLapTime = fastestLapTime
            
        }
        
        self.firstName = firstName
        self.lastName = lastName
        self.position = position
        self.carNumber = carNumber
        self.driverCode = driverCode
        self.carNumber = carNumber
        self.driverURLString = driverURLString
        self.nationality = nationality
        self.dateOfBirth = dateOfBirth
        self.points = points
        self.teamName = teamName
        self.gridPosition = gridPosition
        self.laps = laps
        self.status = status
        
    }
    
}
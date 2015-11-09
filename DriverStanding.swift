//
//  DriverStanding.swift
//  F1Results
//
//  Created by Mike Gilroy on 08/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import Foundation

class DriverStanding {
        
    let firstNameKey = "givenName"
    let lastNameKey = "familyName"
    let driverCodeKey = "code"
    let nationalityKey = "nationality"
    let carNumberKey = "permanentNumber"
    let dateOfBirthKey = "dateOfBirth"
    let pointsKey = "points"
    let teamNameKey = "name"
    let positionKey = "position"
    let winsKey = "wins"
    
    var firstName: String
    var lastName: String
    var fullName: String {
        return firstName + " " + lastName
    }
    var position: Int
    var points: String
    var driverCode: String
    var nationality: String
    var carNumber: String?
    var dateOfBirth: String
    var teamName: String
    var wins: Int
    
    
    init(jsonDictionary: [String: AnyObject]) {
        
        // Get data from main jsonDictionary
        let positionString = jsonDictionary[positionKey] as! String
        let position = Int(positionString)!
        let points = jsonDictionary[pointsKey] as! String
        let winsString = jsonDictionary[winsKey] as! String
        let wins = Int(winsString)!
        
        // Get data from sub dictionary of: Driver
        let driverDictionary = jsonDictionary["Driver"] as! [String: AnyObject]
        
        let firstName = driverDictionary[firstNameKey] as! String
        let lastName = driverDictionary[lastNameKey] as! String
        if let carNumber = driverDictionary[carNumberKey] as? String {
            self.carNumber = carNumber
        }
        let driverCode = driverDictionary[driverCodeKey] as! String
        let nationality = driverDictionary[nationalityKey] as! String
        let dateOfBirth = driverDictionary[dateOfBirthKey] as! String
        
        // Get data from sub dictionary of: Constructor
        let constructorArray = jsonDictionary["Constructors"] as! [[String: AnyObject]]
        let constructorDictionary = constructorArray[0] 
        let teamName = constructorDictionary[teamNameKey] as! String
        
        
        self.firstName = firstName
        self.lastName = lastName
        self.position = position
        self.driverCode = driverCode
        self.nationality = nationality
        self.dateOfBirth = dateOfBirth
        self.points = points
        self.teamName = teamName
        self.wins = wins
    }
    
}
//
//  ConstructorStanding.swift
//  F1Results
//
//  Created by Mike Gilroy on 09/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import Foundation

class ConstructorStanding {
    
    private let kName = "name"
    private let kNationality = "nationality"
    private let kUrlString = "url"
    private let kPosition = "position"
    private let kPoints = "points"
    private let kWins = "wins"
    
    var name: String
    var nationality: String
    var urlString: String
    var position: Int
    var points: Int
    var wins: Int
    
    init(jsonDictionary: [String: AnyObject]) {
     
        let position = jsonDictionary[kPosition] as! String
        let points = jsonDictionary[kPoints] as! String
        let wins = jsonDictionary[kWins] as! String
        
        let constructorDictionary = jsonDictionary["Constructor"] as! [String: AnyObject]
        let name = constructorDictionary[kName] as! String
        let nationality = constructorDictionary[kNationality] as! String
        let urlString = constructorDictionary[kUrlString] as! String
        
        self.position = Int(position)!
        self.points = Int(points)!
        self.wins = Int(wins)!
        self.name = name
        self.nationality = nationality
        self.urlString = urlString
        
    }
}
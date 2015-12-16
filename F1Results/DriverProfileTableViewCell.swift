//
//  DriverProfileTableViewCell.swift
//  F1Results
//
//  Created by Mike Gilroy on 15/12/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import UIKit

class DriverProfileTableViewCell: UITableViewCell {
    
    // MARK: Outlets
    
    @IBOutlet weak var driverPhotoImageView: UIImageView!
    @IBOutlet weak var driverNameLabel: UILabel!
    @IBOutlet weak var driverFlagImageView: UIImageView!
    @IBOutlet weak var driverNumberLabel: UILabel!
    @IBOutlet weak var driverTeamLabel: UILabel!
    @IBOutlet weak var driverPositionLabel: UILabel!
    
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var statusWinsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var gridPositionLabel: UILabel!
    @IBOutlet weak var finalPositionLabel: UILabel!
    @IBOutlet weak var fastestLapLabel: UILabel!
    
    @IBOutlet weak var pointsTitleLabel: UILabel!
    @IBOutlet weak var statusWinsTitleLabel: UILabel!
    @IBOutlet weak var timeTitleLabel: UILabel!
    @IBOutlet weak var gridPositionTitleLabel: UILabel!
    @IBOutlet weak var finalPositionTitleLabel: UILabel!
    @IBOutlet weak var fastestLapTitleLabel: UILabel!
    
    
    // MARK: Helper Methods
    
    func updateCellWithRaceResult(raceResult: RaceResult) {
        self.driverNameLabel.text = raceResult.fullName
        self.driverFlagImageView.image = imageFromNationality(raceResult.nationality)
        self.driverPhotoImageView.image = imageFromName(raceResult.lastName)
        if let carNumber = raceResult.carNumber {
            self.driverNumberLabel.text = "#\(carNumber)"
        }
        self.driverTeamLabel.text = raceResult.teamName.uppercaseString
        
        switch raceResult.position {
        case 1, 21:
            self.driverPositionLabel.text = "\(raceResult.position)st"
        case 2, 22:
            self.driverPositionLabel.text = "\(raceResult.position)nd"
        case 3, 23:
            self.driverPositionLabel.text = "\(raceResult.position)rd"
        default:
            self.driverPositionLabel.text = "\(raceResult.position)th"
        }
            self.pointsLabel.text = "\(raceResult.points) pts"
            self.statusWinsLabel.text = raceResult.status
            self.timeLabel.text = raceResult.finalTime
            self.gridPositionLabel.text = raceResult.gridPosition
            self.finalPositionLabel.text = "\(raceResult.position)"
            if let fastestLapTime = raceResult.fastestLapTime {
                self.fastestLapLabel.text = fastestLapTime
            }
            self.statusWinsTitleLabel.text = "STATUS:"
            
            // Hide neccessary labels
            self.timeLabel.hidden = false
            self.gridPositionLabel.hidden = false
            self.finalPositionLabel.hidden = false
            self.fastestLapLabel.hidden = false
            self.timeTitleLabel.hidden = false
            self.gridPositionTitleLabel.hidden = false
            self.finalPositionTitleLabel.hidden = false
            self.fastestLapTitleLabel.hidden = false
            
        }
        
        func updateCellWithDriverStanding(driverStanding: DriverStanding) {
            
            self.driverNameLabel.text = driverStanding.fullName
            self.driverFlagImageView.image = imageFromNationality(driverStanding.nationality)
            self.driverPhotoImageView.image = imageFromName(driverStanding.lastName)
            if let carNumber = driverStanding.carNumber {
                self.driverNumberLabel.text = "#\(carNumber)"
            }
            self.driverTeamLabel.text = driverStanding.teamName.uppercaseString
            
            switch driverStanding.position {
            case 1, 21:
                self.driverPositionLabel.text = "\(driverStanding.position)st"
            case 2, 22:
                self.driverPositionLabel.text = "\(driverStanding.position)nd"
            case 3, 23:
                self.driverPositionLabel.text = "\(driverStanding.position)rd"
            default:
                self.driverPositionLabel.text = "\(driverStanding.position)th"
            }
            
            self.pointsLabel.text = "\(driverStanding.points) pts"
            self.statusWinsLabel.text = "\(driverStanding.wins)"
            self.statusWinsTitleLabel.text = "WINS:"
            
            // Hide neccessary labels
            self.timeLabel.hidden = true
            self.gridPositionLabel.hidden = true
            self.finalPositionLabel.hidden = true
            self.fastestLapLabel.hidden = true
            self.timeTitleLabel.hidden = true
            self.gridPositionTitleLabel.hidden = true
            self.finalPositionTitleLabel.hidden = true
            self.fastestLapTitleLabel.hidden = true
        }
        
        
        func imageFromNationality(nationality: String) -> UIImage {
            
            switch nationality.lowercaseString {
            case "british":
                return UIImage(named: "United-Kingdom")!
            case "german":
                return UIImage (named: "Germany")!
            case "australian":
                return UIImage (named: "Australia")!
            case "finnish":
                return UIImage(named: "Finland")!
            case "spanish":
                return UIImage(named: "Spain")!
            case "brazilian":
                return UIImage(named: "Brazil")!
            case "russian":
                return UIImage(named: "Russia")!
            case "french":
                return UIImage(named: "France")!
            case "venezuelan":
                return UIImage(named: "Venezuela")!
            case "swedish":
                return UIImage(named: "Sweden")!
            case "american":
                return UIImage(named: "United-States")!
            case "mexican":
                return UIImage(named: "Mexico")!
            case "dutch":
                return UIImage(named: "Netherlands")!
            case "danish":
                return UIImage(named: "Denmark")!
            default:
                return UIImage(named: "United-Kingdom")!
            }
        }
        
        func imageFromName(name: String) -> UIImage {
            
            switch name.lowercaseString {
            case "hamilton":
                return UIImage(named: "HAM")!
            case "button":
                return UIImage(named: "BUTTON")!
            case "sainz":
                return UIImage(named: "SAINZ")!
            case "hülkenberg":
                return UIImage(named: "HULK")!
            case "alonso":
                return UIImage(named: "ALONSO")!
            case "vettel":
                return UIImage(named: "VETTEL")!
            case "rosberg":
                return UIImage(named: "ROSBERG")!
            case "verstappen":
                return UIImage(named: "VERSTAPPEN")!
            case "massa":
                return UIImage(named: "MASSA")!
            case "ricciardo":
                return UIImage(named: "RIC")!
            case "rossi":
                return UIImage(named: "ROSSI")!
            case "stevens":
                return UIImage(named: "STEVENS")!
            case "pérez":
                return UIImage(named: "PEREZ")!
            case "nasr":
                return UIImage(named: "NASR")!
            case "merhi":
                return UIImage(named: "MEHRI")!
            case "maldonado":
                return UIImage(named: "MALD")!
            case "kvyat":
                return UIImage(named: "KVYAT")!
            case "räikkönen":
                return UIImage(named: "KIMI")!
            case "grosjean":
                return UIImage(named: "GROSJEAN")!
            case "ericsson":
                return UIImage(named: "ERICSSON")!
            case "bottas":
                return UIImage(named: "BOTTAS")!
            case "magnussen":
                return UIImage(named: "KEVIN")!
            default:
                return UIImage(named: "HAM")!
            }
        }
        
        
        
        
}

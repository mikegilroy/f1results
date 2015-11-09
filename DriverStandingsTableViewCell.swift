//
//  DriverStandingsTableViewCell.swift
//  F1Results
//
//  Created by Mike Gilroy on 08/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import UIKit

class DriverStandingsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var teamIconImageView: UIImageView!
    @IBOutlet weak var positionLabel: UILabel!
    
    @IBOutlet weak var nationalityImageView: UIImageView!
    
    @IBOutlet weak var firstNameLabel: UILabel!
    
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var teamNameLabel: UILabel!
    
    @IBOutlet weak var pointsLabel: UILabel!
    
    func updateCellFromDriverStanding(driverStanding: DriverStanding) {
        self.firstNameLabel.text = driverStanding.firstName.uppercaseString
        self.lastNameLabel.text = driverStanding.lastName.uppercaseString
        
        self.pointsLabel.text = driverStanding.points
        self.positionLabel.text = "\(driverStanding.position)"
        self.teamIconImageView.image = teamIconFromRaceResult(driverStanding)
        if driverStanding.teamName.lowercaseString.containsString("manor") {
            self.teamNameLabel.text = "MARUSSIA"
        } else {
            self.teamNameLabel.text = driverStanding.teamName.uppercaseString
        }
        self.nationalityImageView.image = imageFromNationality(driverStanding.nationality)
    }
    
    
    
    func teamIconFromRaceResult(driverStanding: DriverStanding) -> UIImage {
        let team = driverStanding.teamName.lowercaseString
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


}

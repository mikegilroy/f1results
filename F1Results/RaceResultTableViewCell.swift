//
//  RaceResultTableViewCell.swift
//  F1Results
//
//  Created by Mike Gilroy on 08/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import UIKit

class RaceResultTableViewCell: UITableViewCell {

    // MARK: Outelts
    
    @IBOutlet weak var teamIconImageView: UIImageView!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    
    // MARK: Helper Functions
    
    func updateCellWithRaceResult(raceResult: RaceResult) {
        self.firstNameLabel.text = raceResult.firstName.uppercaseString
        self.lastNameLabel.text = raceResult.lastName.uppercaseString
        if raceResult.finalTime == "N/A" {
            if raceResult.status.containsString("+") {
                self.timeLabel.textColor = UIColor.blackColor()
                self.timeLabel.text = raceResult.status
            } else {
                self.timeLabel.textColor = UIColor.redColor()
                self.timeLabel.text = raceResult.status
            }
        } else {
            self.timeLabel.textColor = UIColor.blackColor()
            self.timeLabel.text = raceResult.finalTime
        }

        self.pointsLabel.text = raceResult.points
        self.positionLabel.text = "\(raceResult.position)"
        self.teamIconImageView.image = teamIconFromRaceResult(raceResult)
    }
    
    func teamIconFromRaceResult(raceResult: RaceResult) -> UIImage {
        let team = raceResult.teamName.lowercaseString
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

}

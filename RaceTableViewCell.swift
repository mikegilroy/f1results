//
//  RaceTableViewCell.swift
//  F1Results
//
//  Created by Mike Gilroy on 07/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import UIKit

class RaceTableViewCell: UITableViewCell {

    @IBOutlet weak var raceImageView: UIImageView!
    
    @IBOutlet weak var raceNameLabel: UILabel!
    
    @IBOutlet weak var raceCircuitLabel: UILabel!
    
    @IBOutlet weak var raceMonthLabel: UILabel!
    
    @IBOutlet weak var raceDaysLabel: UILabel!
    
    
    
    // MARK: Functions
    
    func updateCellWithRace(race: Race, indexPath: NSIndexPath) {
        raceNameLabel.text = race.raceName
        raceCircuitLabel.text = race.circuitName
        raceImageView.image = RaceListTableViewController.flageImageFromString(race.raceName)
        raceMonthLabel.text = monthTextFromRaceIndex(indexPath.row)
        raceDaysLabel.text = daysTextFromRaceIndex(indexPath.row)
    }
    
    func monthTextFromRaceIndex(raceIndex: Int) -> String {
        switch raceIndex {
        case 0: return "MAR"
        case 1: return "MAR"
        case 2: return "APR"
        case 3: return "APR"
        case 4: return "MAY"
        case 5: return "MAY"
        case 6: return "JUN"
        case 7: return "JUN"
        case 8: return "JUL"
        case 9: return "JUL"
        case 10: return "AUG"
        case 11: return "SEP"
        case 12: return "SEP"
        case 13: return "SEP"
        case 14: return "OCT"
        case 15: return "OCT"
        case 16: return "OCT-NOV"
        case 17: return "NOV"
        case 18: return "NOV"
        default: return ""
        }
    }
    
    func daysTextFromRaceIndex(raceIndex:Int) -> String {
        switch raceIndex {
        case 0: return "13-15"
        case 1: return "27-29"
        case 2: return "10-12"
        case 3: return "17-19"
        case 4: return "8-10"
        case 5: return "21-24"
        case 6: return "5-7"
        case 7: return "19-21"
        case 8: return "3-5"
        case 9: return "24-26"
        case 10: return "21-23"
        case 11: return "4-6"
        case 12: return "18-20"
        case 13: return "25-27"
        case 14: return "9-11"
        case 15: return "23-25"
        case 16: return "30-1"
        case 17: return "13-15"
        case 18: return "27-29"
        default: return ""
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

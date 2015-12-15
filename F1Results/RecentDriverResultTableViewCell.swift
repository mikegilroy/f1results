//
//  RecentDriverResultTableViewCell.swift
//  F1Results
//
//  Created by Mike Gilroy on 15/12/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import UIKit

class RecentDriverResultTableViewCell: UITableViewCell {

    // MARK: Outlets
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var raceNameLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    
    func updateCellWithResult(result: RecentDriverResult) {
        flagImageView.image = RaceController.flageImageFromString(result.race)
        raceNameLabel.text = result.race.uppercaseString
        switch result.position {
        case 1, 21:
            self.positionLabel.text = "\(result.position)st"
        case 2, 22:
            self.positionLabel.text = "\(result.position)nd"
        case 3, 23:
            self.positionLabel.text = "\(result.position)rd"
        default:
            self.positionLabel.text = "\(result.position)th"
        }
        pointsLabel.text = "\(result.points) pts"
    }

}

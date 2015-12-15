//
//  ConstructorStandingTableViewCell.swift
//  F1Results
//
//  Created by Mike Gilroy on 09/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import UIKit

class ConstructorStandingTableViewCell: UITableViewCell {

    // MARK: Outlets
    
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var teamIconImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamCarImageView: UIImageView!
    @IBOutlet weak var pointsLabel: UILabel!
    
   
    // MARK: Helper Methods
    
    func updateCellWithConstructorStanding(standing: ConstructorStanding) {
        self.positionLabel.text = "\(standing.position)"
        self.teamIconImageView.image = ConstructorStandingsController.teamIconFromConstructorStanding(standing)
        self.teamNameLabel.text = standing.teamName.uppercaseString
        self.teamCarImageView.image = ConstructorStandingsController.teamCarFromConstructorStanding(standing)
        self.pointsLabel.text = "\(standing.points)"
    }

}

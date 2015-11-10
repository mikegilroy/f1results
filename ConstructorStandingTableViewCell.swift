//
//  ConstructorStandingTableViewCell.swift
//  F1Results
//
//  Created by Mike Gilroy on 09/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import UIKit

class ConstructorStandingTableViewCell: UITableViewCell {

    // MARK: Properties / Outlets
    
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var teamIconImageView: UIImageView!
    @IBOutlet weak var nationalityImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamLogoImageView: UIImageView!
    @IBOutlet weak var teamCarImageView: UIImageView!
    @IBOutlet weak var pointsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func updateCellWithConstructorStanding(standing: ConstructorStanding) {
        self.positionLabel.text = "\(standing.position)"
        self.teamIconImageView.image = ConstructorStandingsController.teamIconFromConstructorStanding(standing)
        //self.nationalityImageView.image = ConstructorStandingsController.flageImageFromStanding(standing)
        self.teamNameLabel.text = standing.teamName.uppercaseString
        // self.teamLogoImageView.image = ConstructorStandingsController.teamLogoFromConstructorStanding(standing)
        self.teamCarImageView.image = ConstructorStandingsController.teamCarFromConstructorStanding(standing)
        self.pointsLabel.text = "\(standing.points)"
    }
    
    

}

//
//  DriverProfileTableViewController.swift
//  F1Results
//
//  Created by Mike Gilroy on 06/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import UIKit

class DriverProfileTableViewController: UITableViewController {

    // Properties / Outlets
    
    @IBOutlet weak var driverNameLabel: UILabel!
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var driverPhotoImageView: UIImageView!
    @IBOutlet weak var nationalityLabel: UILabel!
    @IBOutlet weak var carNumberLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var finishPositionLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var gridPositionLabel: UILabel!
    @IBOutlet weak var finalPositionLabel: UILabel!
    @IBOutlet weak var fastestLapTimeLabel: UILabel!
    @IBOutlet weak var recentResultsTableView: UITableView!
    
    @IBOutlet weak var pointsTitleLabel: UILabel!
    @IBOutlet weak var statusWinsTitleLabel: UILabel!
    
    @IBOutlet weak var statsTableViewCell: UITableViewCell!
    
    var raceResult: RaceResult?
    var race: Race?
    
    var driverStanding: DriverStanding?
    
    var viewMode: ViewMode = .driverStanding
    
    enum ViewMode {
        case driverStanding
        case raceResult
    }
    
    func layoutViewsBasedOnMode(mode: ViewMode) {
        switch self.viewMode {
        case .driverStanding:
            self.statusWinsTitleLabel.text = "WINS:"
        case .raceResult:
            self.statusWinsTitleLabel.text = "STATUS:"
        }
    }
    
    
    
    func updateWithRaceResult(raceResult: RaceResult) {
        
        self.title = self.race?.raceName
        
        self.driverNameLabel.text = raceResult.fullName
        self.flagImageView.image = imageFromNationality(raceResult.nationality)
        self.driverPhotoImageView.image = imageFromName(raceResult.lastName)
        self.nationalityLabel.text = raceResult.nationality
        if let carNumber = raceResult.carNumber {
            self.carNumberLabel.text = "#\(carNumber)"
        }
        self.teamLabel.text = raceResult.teamName.uppercaseString
        
        if raceResult.status == "Finished" {
            switch raceResult.position {
            case 1, 21:
                self.finishPositionLabel.text = "\(raceResult.position)st"
            case 2, 22:
                self.finishPositionLabel.text = "\(raceResult.position)nd"
            case 3, 23:
                self.finishPositionLabel.text = "\(raceResult.position)rd"
            default:
                self.finishPositionLabel.text = "\(raceResult.position)th"
            }
        } else {
            self.finishPositionLabel.text = "DNF"
        }
        
        self.pointsLabel.text = "\(raceResult.points) pts"
        self.statusLabel.text = raceResult.status
        self.timeLabel.text = raceResult.finalTime
        self.gridPositionLabel.text = raceResult.gridPosition
        self.finalPositionLabel.text = "\(raceResult.position)"
        if let fastestLapTime = raceResult.fastestLapTime {
            self.fastestLapTimeLabel.text = fastestLapTime
        }
        
        
    }
    
    func updateWithDriverStanding(standing: DriverStanding) {
        
        self.title = self.driverStanding?.fullName
        
        self.driverNameLabel.text = standing.fullName
        self.flagImageView.image = imageFromNationality(standing.nationality)
        self.driverPhotoImageView.image = imageFromName(standing.lastName)
        self.nationalityLabel.text = standing.nationality
        if let carNumber = standing.carNumber {
            self.carNumberLabel.text = "#\(carNumber)"
        }
        self.teamLabel.text = standing.teamName.uppercaseString

        switch standing.position {
            case 1, 21:
                self.finishPositionLabel.text = "\(standing.position)st"
            case 2, 22:
                self.finishPositionLabel.text = "\(standing.position)nd"
            case 3, 23:
                self.finishPositionLabel.text = "\(standing.position)rd"
            default:
                self.finishPositionLabel.text = "\(standing.position)th"
            }
        
        self.pointsLabel.text = "\(standing.points) pts"
        self.statusLabel.text = "\(standing.wins)"
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        layoutViewsBasedOnMode(self.viewMode)
    }
    
    
    

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Recent Results"
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("recentDriverResultCell", forIndexPath: indexPath)
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  RaceResultsTableViewController.swift
//  F1Results
//
//  Created by Mike Gilroy on 06/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import UIKit

class RaceResultsTableViewController: UITableViewController {

    // MARK: Properties
    
    var race: Race?
    var resultsArray: [RaceResult] = []

    
    // MARK: ViewDid Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("driverResultCell", forIndexPath: indexPath) as! RaceResultTableViewCell

        let driverResult = resultsArray[indexPath.row]
        cell.updateCellWithRaceResult(driverResult)
        
        return cell
    }
    

    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     
        if segue.identifier == "toDriverRaceResultProfile" {
            let driverProfileScene = segue.destinationViewController as! DriverProfileTableViewController
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let _ = driverProfileScene.view
                
                let raceResult = self.resultsArray[indexPath.row]
                
                driverProfileScene.title = raceResult.fullName
                driverProfileScene.raceResult = raceResult
                driverProfileScene.race = self.race
                driverProfileScene.viewMode = .raceResult
                driverProfileScene.driverCode = raceResult.driverCode
                driverProfileScene.updateWithRecentResults()
            }
        }
    }
    
}

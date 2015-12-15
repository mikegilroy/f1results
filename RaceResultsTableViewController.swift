//
//  RaceResultsTableViewController.swift
//  F1Results
//
//  Created by Mike Gilroy on 06/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import UIKit

class RaceResultsTableViewController: UITableViewController {

    // MARK: Properties / Variables
    
    var race: Race?
    var resultsArray: [RaceResult] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }

    
    // MARK: Functions
    
    

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

    
    // MARK: - Navigation

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     
        if segue.identifier == "toDriverRaceResultProfile" {
            
            let driverProfileScene = segue.destinationViewController as! DriverProfileTableViewController
            
            if let indexPath = tableView.indexPathForSelectedRow {
                
                let _ = driverProfileScene.view
                
                let raceResult = self.resultsArray[indexPath.row]
                
                driverProfileScene.raceResult = raceResult
                driverProfileScene.race = self.race
                driverProfileScene.viewMode = .raceResult
                
                driverProfileScene.updateWithRaceResult(raceResult)
                driverProfileScene.driverCode = raceResult.driverCode
                driverProfileScene.updateWithRecentResults()
            }
        }
    }
    

}

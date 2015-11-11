//
//  DriverStandingsTableViewController.swift
//  F1Results
//
//  Created by Mike Gilroy on 08/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import UIKit

class DriverStandingsTableViewController: UITableViewController {

    var driverStandingsArray : [DriverStanding] = []
    
    override func viewWillAppear(animated: Bool) {
        loadDriverStandings()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDriverStandings()
    }
    
    func loadDriverStandings() {
        DriverStandingsController.getDriverStandings { (driverStandingsArray) -> Void in
            if let driverStandingsArray = driverStandingsArray {
                self.driverStandingsArray = driverStandingsArray
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                    self.refreshControl?.endRefreshing()
                    print(driverStandingsArray)
                })
                
            } else {
                print("no driver standings")
            }
        }
    }

    @IBAction func userRefreshedResults(sender: AnyObject) {
        loadDriverStandings()
    }
    

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.driverStandingsArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("driverStandingCell", forIndexPath: indexPath) as! DriverStandingsTableViewCell
        
        let driverStanding = driverStandingsArray[indexPath.row]
        
        cell.updateCellFromDriverStanding(driverStanding)

        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 54
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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toDriverStandingProfile" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                let driverStanding = driverStandingsArray[indexPath.row]

                let driverProfileScene = segue.destinationViewController as! DriverProfileTableViewController
                
                _ = driverProfileScene.view
                
                driverProfileScene.driverStanding = driverStanding
                driverProfileScene.viewMode = .driverStanding
                driverProfileScene.updateWithDriverStanding(driverStanding)
            }
        }
    }
    
}

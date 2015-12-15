//
//  DriverStandingsTableViewController.swift
//  F1Results
//
//  Created by Mike Gilroy on 08/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import UIKit

class DriverStandingsTableViewController: UITableViewController {

    var driverStandingsArray : [DriverStanding] = DriverStandingsController.sharedInstance.driverStandingsArray
    
    
    // MARK: viewDid Functions
    
    override func viewWillAppear(animated: Bool) {
        loadDriverStandings()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDriverStandings()
    }
    
    
    // MARK: Actions

    @IBAction func userRefreshedResults(sender: AnyObject) {
        loadDriverStandings()
    }
    
    
    // MARK: Helper Functions
    
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

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toDriverStandingProfile" {
            
            if let indexPath = tableView.indexPathForSelectedRow {
                let driverStanding = driverStandingsArray[indexPath.row]

                let driverProfileScene = segue.destinationViewController as! DriverProfileTableViewController
                
                _ = driverProfileScene.view
                
                driverProfileScene.driverStanding = driverStanding
                driverProfileScene.viewMode = .driverStanding
                driverProfileScene.driverCode = driverStanding.driverCode
                driverProfileScene.updateWithRecentResults()
            }
        }
    }
    
}

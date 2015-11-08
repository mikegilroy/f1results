//
//  RaceListTableViewController.swift
//  F1Results
//
//  Created by Mike Gilroy on 06/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import UIKit

class RaceListTableViewController: UITableViewController {

    var races: [Race]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.tableView.backgroundColor = UIColor(patternImage: UIImage(named: "brushedSteel")!)
        loadRaces()
        
        
        
    }

    @IBAction func userRefreshedTable(sender: AnyObject) {
        loadRaces()
    }

    
    func loadRaces() {
        RaceController.getRaces { (racesArray) -> Void in
            if let races = racesArray {
                self.races = races
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                    self.refreshControl?.endRefreshing()
                    print(races)
                })
                
            } else {
                print("no races")
            }
        }
    }
    
    
    
    static func flageImageFromString(raceName: String) -> UIImage {
        let raceName = raceName.lowercaseString
        if raceName.containsString("australia") {
            return UIImage(named: "Australia")!
        } else if raceName.containsString("british") {
            return UIImage(named: "United-Kingdom")!
        } else if raceName.containsString("german") {
            return UIImage(named: "Germany")!
        } else if raceName.containsString("malaysia") {
            return UIImage(named: "Malaysia")!
        } else if raceName.containsString("monaco") {
            return UIImage(named: "Monaco")!
        } else if raceName.containsString("spanish") {
            return UIImage(named: "Spain")!
        } else if raceName.containsString("chinese") {
            return UIImage(named: "China")!
        } else if raceName.containsString("canadian") {
            return UIImage(named: "Canada")!
        } else if raceName.containsString("bahrain") {
            return UIImage(named: "Bahrain")!
        } else if raceName.containsString("austrian") {
            return UIImage(named: "Austria")!
        } else if raceName.containsString("hungarian") {
            return UIImage(named: "Hungary")!
        } else if raceName.containsString("belgian") {
            return UIImage(named: "Belgium")!
        } else if raceName.containsString("italian") {
            return UIImage(named: "Italy")!
        } else if raceName.containsString("singapore") {
            return UIImage(named: "Singapore")!
        } else if raceName.containsString("japanese") {
            return UIImage(named: "Japan")!
        } else if raceName.containsString("russian") {
            return UIImage(named: "Russia")!
        } else if raceName.containsString("states") {
            return UIImage(named: "United-States")!
        } else if raceName.containsString("mexican") {
            return UIImage(named: "Mexico")!
        } else  {
            return UIImage(named: "United-Kingdom")!
        }
    }

    
    
    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let races = races {
            return races.count
        } else {
            return 0
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("raceCell", forIndexPath: indexPath) as! RaceTableViewCell

        if let races = self.races {
            
            let race = races[indexPath.row]
            cell.updateCellWithRace(race, indexPath: indexPath)
        }
        
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
        
        if segue.identifier == "toRaceResult" {
            
            guard let races = races else { return }
            
            if let indexPath = tableView.indexPathForSelectedRow {
             
                let race = races[indexPath.row]
                let raceResultScene = segue.destinationViewController as! RaceResultsTableViewController
                
                let _ = raceResultScene.view
                
                raceResultScene.race = race
                raceResultScene.resultsArray = DriverResultController.getDriverResultsArray(race)
                raceResultScene.title = race.raceName
            }
        }
    }
    

}

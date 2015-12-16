//
//  RaceListTableViewController.swift
//  F1Results
//
//  Created by Mike Gilroy on 06/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import UIKit

class RaceListTableViewController: UITableViewController {

    // MARK: Properties
    
    var races: [Race]?
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    // MARK: Actions

    @IBAction func userRefreshedTable(sender: AnyObject) {
        loadRaces()
    }
    
    
    // MARK: ViewDid Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startActivityIndicator()
        loadRaces()
    }

    
    // MARK: Helper Functions
    
    func loadRaces() {
        RaceController.getRaces { (racesArray) -> Void in
            if let races = racesArray {
                self.races = races
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                    self.refreshControl?.endRefreshing()
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.hidden = true
                    print(races)
                })
                
            } else {
                print("no races")
            }
        }
    }
    
    func startActivityIndicator() {
        let frame = activityIndicator.frame
        self.activityIndicator.frame = (CGRect(x: ((self.view.frame.width / 2) - 18), y:5, width: frame.width, height: frame.height))
        self.view.addSubview(self.activityIndicator)
        activityIndicator.startAnimating()
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
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 54
    }
    
    
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

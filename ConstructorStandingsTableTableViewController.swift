//
//  ConstructorStandingsTableTableViewController.swift
//  F1Results
//
//  Created by Mike Gilroy on 09/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import UIKit

class ConstructorStandingsTableTableViewController: UITableViewController {

    // MARK: Properties
    
    var constructorStandingsArray: [ConstructorStanding] = ConstructorStandingsController.sharedInstance.constructorStandingsArray
    
    // MARK: Outlets
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    
    // MARK: ViewDid Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startActivityIndicator()
        loadStandings()
    }

    
    // MARK: Actions
    
    @IBAction func userRefreshedTable(sender: AnyObject) {
        loadStandings()
    }
    
    
    // MARK: Helper Functions
    
    func loadStandings() {
        ConstructorStandingsController.getDriverStandings { (constructorStandingsArray) -> Void in
            if let constructorStandingsArray = constructorStandingsArray {
                var newArray = constructorStandingsArray
                newArray.removeLast()
                self.constructorStandingsArray = newArray
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.tableView.reloadData()
                    self.refreshControl?.endRefreshing()
                    self.activityIndicator.hidden = true
                    print(constructorStandingsArray)
                })
            } else {
                print("No constructor standings")
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
        return self.constructorStandingsArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("constructorStandingCell", forIndexPath: indexPath) as! ConstructorStandingTableViewCell

        let constructorStanding = self.constructorStandingsArray[indexPath.row]
        cell.updateCellWithConstructorStanding(constructorStanding)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 54
    }
    
}

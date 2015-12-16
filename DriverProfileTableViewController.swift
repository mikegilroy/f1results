//
//  DriverProfileTableViewController.swift
//  F1Results
//
//  Created by Mike Gilroy on 06/11/2015.
//  Copyright © 2015 Mike Gilroy. All rights reserved.
//

import UIKit

class DriverProfileTableViewController: UIViewController {

    // MARK: Properties
    
    var raceResult: RaceResult?
    var race: Race?
    var recentResults: [RecentDriverResult] = []
    var driverStanding: DriverStanding?
    var driverCode: String = ""
    
    var viewMode: ViewMode = .driverStanding
    
    enum ViewMode {
        case driverStanding
        case raceResult
    }
    
    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: ViewDid Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateWithRecentResults()
    }

    
    // MARK: Helper Methods
    
    func updateWithRecentResults() {
        self.recentResults = []
        for race in RaceController.sharedInstance.races {
            let recentResult = RecentDriverResult(race: race, driverCode: driverCode)
            self.recentResults.append(recentResult)
        }
        self.recentResults.sortInPlace { (first, second) -> Bool in
            return first.roundNumber > second.roundNumber
        }
        self.tableView.reloadData()
    }

    
}



extension DriverProfileTableViewController: UITableViewDataSource, UITableViewDelegate {

    // MARK: - Table view data source

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            switch viewMode {
            case .driverStanding:
                    return "Championship Standing"
            case .raceResult:
                return "\(self.race!.raceName) Result"
            }
        case 1:
            return "Recent Race Results"
        default:
            return ""
        }
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return recentResults.count
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("driverProfileCell", forIndexPath: indexPath) as! DriverProfileTableViewCell
            
            switch viewMode {
            case .raceResult:
                cell.updateCellWithRaceResult(self.raceResult!)
            case .driverStanding:
                cell.updateCellWithDriverStanding(self.driverStanding!)
            }
            
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("recentDriverResultCell", forIndexPath: indexPath) as! RecentDriverResultTableViewCell
            let recentResult = self.recentResults[indexPath.row]
            cell.updateCellWithResult(recentResult)
            
            return cell
        
        default:
            break
        }
        let cell = tableView.dequeueReusableCellWithIdentifier("driverProfileCell", forIndexPath: indexPath) as! DriverProfileTableViewCell
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            switch viewMode {
            case .driverStanding:
                return CGFloat(210)
            case .raceResult:
                return CGFloat(316)
            }
            
        } else {
            return CGFloat(52)
        }
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        
        header.backgroundView?.backgroundColor = UIColor.redColor()
        header.textLabel!.textColor = UIColor.whiteColor()
        header.textLabel!.frame = header.frame
        header.textLabel!.textAlignment = NSTextAlignment.Center
    }
    
}

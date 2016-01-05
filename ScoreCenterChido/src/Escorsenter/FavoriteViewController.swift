//
//  FavoriteViewController.swift
//  Escorsenter
//
//  Created by En Calientes Mac 2 on 13/10/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import Foundation
import UIKit

class FavoriteViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var topTab: UISegmentedControl!
    @IBOutlet weak var favoritesTable: UITableView!
    
    var teamArray : [TeamDto] = []
    var teamsManager = TeamsManager()
    
    var selectedTeam : TeamDto?
    
    var leagueArray: [LeagueDto] = []
    var leaguesManager = LeaguesManager()
    
    var selectedLeague : LeagueDto?
    
    let Identifiers = ["favorite_league", "favorite_team"]
        
    override func viewDidLoad() {
        favoritesTable.delegate = self
        favoritesTable.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        reloadTable()
    }
    
    func reloadTable() {
        leagueArray = leaguesManager.getFavorites()
        teamArray = teamsManager.getFavorites()
        favoritesTable.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let segueId = segue.identifier!
        switch segueId{
        case Identifiers[0]:
            let destinationViewController = segue.destinationViewController as! LeagueViewController
            destinationViewController.League = selectedLeague
            break
        case Identifiers[1]:
            let destinationViewController = segue.destinationViewController as! TeamViewController
            destinationViewController.Team = selectedTeam
            break
        default:
            break
        }
    }
    
    // SegmentedControl Methods
    
    @IBAction func onSegmentToggle(sender: AnyObject) {
        favoritesTable.reloadData()
    }
    
    
    // Table methods
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        let index = indexPath.item
        let selected = topTab.selectedSegmentIndex
        switch selected{
        case 0:
            cell.imageView?.image = UIImage(named: "leagueDefault")
            cell.textLabel!.text = leagueArray[index].name
            break
        case 1:
            cell.imageView?.image = UIImage(named: "teamDefault")
            cell.textLabel!.text = teamArray[index].name
            break
        default:
            break
        }
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let selected = topTab.selectedSegmentIndex
        var numberOfRows = 0
        switch selected {
        case 0:
            numberOfRows = leagueArray.count
            break
        case 1:
            numberOfRows = teamArray.count
            break
        default:
            numberOfRows = 0
        }
        return numberOfRows
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var index = indexPath.item
        var selected = topTab.selectedSegmentIndex
        switch selected{
        case 0:
            selectedLeague = leagueArray[index]
            performSegueWithIdentifier(Identifiers[0], sender: tableView)
            break
        case 1:
            selectedTeam = teamArray[index]
            performSegueWithIdentifier(Identifiers[1], sender: tableView)
            break
        default:
            break
        }
    }
    
}

//
//  BrowseViewController.swift
//  Escorsenter
//
//  Created by En Calientes Mac 2 on 25/09/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import Foundation
import UIKit

class BrowseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ViewDelegate {
    
    @IBOutlet weak var topTab: UISegmentedControl!
    @IBOutlet weak var table: UITableView!
    
    let Identifiers  = ["Browse_Leagues", "Browse_Teams"]
    
    var teamArray : [TeamDto] = []
    var teamsManager : TeamsManager?
    
    var selectedTeam : TeamDto?
    
    var leagueArray: [LeagueDto] = []
    var leaguesManager : LeaguesManager?
    
    var selectedLeague : LeagueDto?
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: Selector("update"), forControlEvents: UIControlEvents.ValueChanged)
        
        return refreshControl
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table.delegate = self
        self.table.dataSource = self
        
        self.teamsManager = TeamsManager()
        self.leaguesManager = LeaguesManager()
        self.table.addSubview(self.refreshControl)
        
        update()
    }
    
    func update(){
        teamArray = teamsManager!.getTeamsFromDB()
        leagueArray = leaguesManager!.getLeaguesFromDB()
        self.teamsManager?.getTeamsFromAPI(self)
        self.leaguesManager?.getLeaguesFromAPI(self)
        
        self.refreshControl.endRefreshing()
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
    
    @IBAction func topTabChange(sender: AnyObject) {
        self.table.reloadData()
    }
    
    // DataLoader functions
    
    func RefreshView(obj : AnyObject, append : Int) {
        switch obj {
        case is Array<TeamDto>:
            self.teamArray = obj as! [TeamDto]
            teamsManager?.addTeamsToDB(teamArray)
            break
        case is Array<LeagueDto>:
            self.leagueArray = obj as! [LeagueDto]
            leaguesManager?.addLeagueToDB(leagueArray)
            break
        default:
            break
        }
        self.table.reloadData()
    }
    
    // TableView functions
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let index = self.topTab.selectedSegmentIndex
        var rows: Int
        switch index {
        case 0:
            rows = self.leagueArray.count
            break
        case 1:
            rows = self.teamArray.count
            break
        default:
            rows = 0
            break
        }
        return rows
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        let index = self.topTab.selectedSegmentIndex
        switch index{
        case 0:
            let league = self.leagueArray[indexPath.row] as LeagueDto
            cell.imageView?.image = UIImage(named: "leagueDefault")
            cell.textLabel!.text = league.name
            break
        case 1:
            let team = self.teamArray[indexPath.row] as TeamDto
            cell.imageView?.image = UIImage(named: "teamDefault")
            cell.textLabel!.text = team.name
            break
        default:
            break
        }
        return cell
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
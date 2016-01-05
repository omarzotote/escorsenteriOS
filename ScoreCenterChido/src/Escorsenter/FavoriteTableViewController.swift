//
//  FavoriteTableViewController.swift
//  Escorsenter
//
//  Created by Francisco Javier Gutierrez Gutierrez on 1/28/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import UIKit

class FavoriteTableViewController: UITableViewController {
    
    //let TeamLoader(self).getFavoriteTeams()
    var teamManager = TeamsManager()
    var leagueManager = LeaguesManager()
    var leagueArray : [LeagueDto] = []
    var teamArray : [TeamDto] = []
    var selectedLeague : LeagueDto? = nil
    var selectedTeam : TeamDto? = nil
    let navigationSegues : [String] = ["FavShowLeagueSegue", "FavShowTeamSegue"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamArray = teamManager.getFavorites()
        leagueArray = leagueManager.getFavorites()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        var nib = UINib(nibName: "HeaderTableCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "headerCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        switch section {
        case 0:
            return leagueArray.count
        case 1:
            return teamArray.count
        default:
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView:HeaderTableCell = tableView.dequeueReusableCellWithIdentifier("headerCell") as! HeaderTableCell
        switch section {
        case 0:
            if(leagueArray.count > 0)
            {
                headerView.headerLabel.text = "Ligas"
            }
        case 1:
            if(teamArray.count > 0)
            {
                headerView.headerLabel.text = "Equipos"
            }
        default:
            headerView.headerLabel.text = ""
        }
        
        return headerView
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellFavorites", forIndexPath: indexPath) as! UITableViewCell
        switch indexPath.section {
        case 0:
            let league = leagueArray[indexPath.row] as LeagueDto
            cell.imageView?.image = UIImage(named: "leagueDefault")
            cell.textLabel!.text = league.name
            break
        case 1:
            let team = teamArray[indexPath.row] as TeamDto
            cell.imageView?.image = UIImage(named: "teamDefault")
            cell.textLabel!.text = team.name
            break
        default:
            break
        }
        return cell
    }
    
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
    // Segues control:
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.section == 0){
            selectedLeague = leagueArray[indexPath.row]
        }
        else{
            selectedTeam = teamArray[indexPath.row]
        }
        performSegueWithIdentifier(navigationSegues[indexPath.section], sender: tableView)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if(segue.identifier == "FavShowLeagueSegue"){
            let destinationVC = segue.destinationViewController as! LeagueViewController
            destinationVC.League = selectedLeague
        }
        else{
            let destinationVC = segue.destinationViewController as! TeamViewController
            destinationVC.Team = selectedTeam
        }
        //destinationVC.titleForHeaderInSection = selectedLeague!.name
    }
    


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
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
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}

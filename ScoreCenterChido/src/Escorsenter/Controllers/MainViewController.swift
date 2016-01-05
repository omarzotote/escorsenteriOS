//
//  MainViewController.swift
//  Escorsenter
//
//  Created by Jose Miguel Arreola on 1/20/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController, ViewDelegate {
    var teamLoader : TeamLoader?
    var leagueLoader : LeagueLoader?
    var leagueArray : [LeagueDto] = []
    var teamArray : [TeamDto] = []
    var selectedLeague : LeagueDto?
    var selectedTeam : TeamDto?
    let navigationSegues : [String] = ["IniShowLeagueSegue", "IniShowTeamSegue"]
    var overlay : UIView?
    var loading : UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*overlay = UIView(frame: self.view.frame)
        overlay!.backgroundColor = UIColor.blackColor()
        overlay!.alpha = 0.5
//        loading!.im
        
        self.view.addSubview(overlay!)
        
        
        var testImage = UIImage.animatedImageWithAnimatedGIFData(
            NSData.dataWithContentsOfURL("http://sierrafire.cr.usgs.gov/images/loading.gif"))
        self.dataImageView.animationImages = testImage.images
        self.dataImageView.animationDuration = testImage.duration
        self.dataImageView.animationRepeatCount = 1
        self.dataImageView.image = testImage.images.lastObject
        self.dataImageView.startAnimating()
        */
        
        
        
        teamLoader = TeamLoader(viewdelegate : self)
        leagueLoader = LeagueLoader(viewdelegate: self)
        teamLoader!.getTeams(false, favorites: false)
        leagueLoader!.getLeagues(false, favorites: false)
        //Load the notifications
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        var nib = UINib(nibName: "HeaderTableCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "headerCell")
        
    }
    
    func RefreshView(obj : AnyObject, append : Int)
    {
        //overlay?.removeFromSuperview()
        switch obj
        {
        case is Array<TeamDto>:
            teamArray = obj as! Array<TeamDto>
            break
        case is Array<LeagueDto>:
            leagueArray = obj as! Array<LeagueDto>
            break
        default:
            break
        }
        self.tableView.reloadData()
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
    
    /*
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String{
        switch section {
        case 0:
            if(leagueArray.count > 0)
            {
                return "Ligas"
            }
        case 1:
            if(teamArray.count > 0)
            {
                return "Equipos"
            }
        default:
            return ""
        }
        return ""
    }
    */
    
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
    
    //editar la celda aqui
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
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
    // segues
    
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
        if(segue.identifier == "IniShowLeagueSegue"){
            let destinationVC = segue.destinationViewController as! LeagueViewController
            destinationVC.League = selectedLeague
        }
        else{
            let destinationVC = segue.destinationViewController as! TeamViewController
            destinationVC.Team = selectedTeam
        }
        //destinationVC.titleForHeaderInSection = selectedLeague!.name
    }
    
    
    
}

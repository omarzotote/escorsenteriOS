//
//  LeagueViewController.swift
//  Escorsenter
//
//  Created by Francisco Javier Gutierrez Gutierrez on 1/27/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import UIKit

class LeagueViewController: UIViewController, ViewDelegate {
    
    var season : SeasonDto?
    var League : LeagueDto?
    
    var pastMatches : SeasonDto?
    var futureMatches : SeasonDto?
    var leagueScoreTableResult : SeasonDto?
    
    let leagueManager = LeaguesManager()
    let futureMatchesManager = FutureMatchesManager()
    let pastMatchesManager = PastMatchesManager()
    let leagueScoreTableResultManager = LeagueScoreTableResultsManager()
    
    
    @IBOutlet weak var Table: UITableView!
    @IBOutlet weak var topTab: UISegmentedControl!
    @IBOutlet var starButton: UIBarButtonItem!
    
    //Swipe down to refresh method
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: Selector("update"), forControlEvents: UIControlEvents.ValueChanged)
        
        return refreshControl
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let topItem = navigationController?.navigationBar.topItem
        topItem!.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        setStarImage()
        
        self.title = League!.name
        self.Table.addSubview(refreshControl)
        update()
        
        var nib = UINib(nibName: "TitleHeaderCell", bundle: nil)
        Table.registerNib(nib, forCellReuseIdentifier: "titleHeaderCell")
        
        nib = UINib(nibName: "HeaderClasifCell", bundle: nil)
        Table.registerNib(nib, forCellReuseIdentifier: "clasifHeaderCell")
        
        nib = UINib(nibName: "ResultadosCell", bundle: nil)
        Table.registerNib(nib, forCellReuseIdentifier: "resulCell")
        
        nib = UINib(nibName: "RolCell", bundle: nil)
        Table.registerNib(nib, forCellReuseIdentifier: "rolCell")
        
        nib = UINib(nibName: "ClasifCell", bundle: nil)
        Table.registerNib(nib, forCellReuseIdentifier: "clasifCell")
    }
    
    //Swipe down to refresh method
    func update() {
        futureMatchesManager.getFutureMatchesFromDBAtIndex(self.League!.id)
        pastMatchesManager.getPastMatchesFromDBAtIndex(self.League!.id)
        leagueScoreTableResultManager.getLeagueScoreTableResultFromDBAtIndex(self.League!.id)
        
        futureMatchesManager.getfutureMatchesFromAPI(self, leagueId: self.League!.id)
        pastMatchesManager.getPastMatchesFromAPI(self, leagueId: self.League!.id)
        leagueScoreTableResultManager.getLeagueScoreTableResultFromAPI(self, id: self.League!.id)
        self.refreshControl.endRefreshing()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        setStarImage()
    }
    
    //favorites button methods
    
    func setStarImage() {
        if leagueManager.isFavorite(League!.id) {
            starButton.image = UIImage(named: "cyanStarIcon")
        }
        else {
            starButton.image = UIImage(named: "favoritesIcon")
        }
    }
    
    @IBAction func starButtonClicked(sender: AnyObject) {
        if leagueManager.isFavorite(League!.id) {
            leagueManager.removeFromFavorites(League!.id)
        }
        else {
            leagueManager.addToFavorites(League!.id)
        }
        setStarImage()
    }
    
    @IBAction func topTabChange(sender: AnyObject) {
        Table.reloadData()
    }
    
    // ViewDelegate methods
    
    func RefreshView(obj : AnyObject, append : Int)
    {
        switch append
        {
        case 1:
            futureMatches = obj as? SeasonDto
            futureMatchesManager.addFutureMatchesToDB(futureMatches!)
            break
        case 2:
            pastMatches = obj as? SeasonDto
            pastMatchesManager.addPastMatchesToDB(pastMatches!)
            break
        case 3:
            leagueScoreTableResult = obj as? SeasonDto
            leagueScoreTableResultManager.addLeagueScoreTableResultToDB(leagueScoreTableResult!)
            break
        default:
            break
        }
        Table.reloadData()
    }
    
    // UITable methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        let index = self.topTab.selectedSegmentIndex
        var numberOfSections : Int?
        switch index {
        case 0:
            numberOfSections = futureMatches?.weeks.count
            break
        case 1:
            numberOfSections = pastMatches?.weeks.count
            break
        case 2:
            numberOfSections = 1
            break
        default:
            numberOfSections = 0
            break
        }
        if numberOfSections != nil
        {
            return numberOfSections!
        }
        return 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let index = self.topTab.selectedSegmentIndex
        var numberOfRows: Int?
        
        switch index{
        case 0:
            numberOfRows = futureMatches?.weeks[section].matches.count
            break
        case 1:
            numberOfRows = pastMatches?.weeks[section].matches.count
            break
        case 2:
            numberOfRows = League?.teams.count
            break
        default:
            break
        }
        
        return numberOfRows!
    }
    
    //La altura de la celda cambia en la tercera seccion
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let index = self.topTab.selectedSegmentIndex

        switch index {
        case 0:
            return RolCell.getHeight()
        case 1:
            return ResultadosCell.getHeight()
        default:
            return ClasifCell.getHeight()
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let index = self.topTab.selectedSegmentIndex
        
        switch index{
        case 0:
            var cell:RolCell = tableView.dequeueReusableCellWithIdentifier("rolCell") as! RolCell
            cell.refreshView(futureMatches?.weeks[indexPath.section].matches[indexPath.row])
            return cell
        case 1:
            var cell = tableView.dequeueReusableCellWithIdentifier("resulCell") as! ResultadosCell
            cell.refreshView(pastMatches?.weeks[indexPath.section].matches[indexPath.row])
            return cell
        default:
            var cell:ClasifCell = tableView.dequeueReusableCellWithIdentifier("clasifCell") as! ClasifCell
            cell.refreshView(leagueScoreTableResult?.scoreTableResult[indexPath.row])
            return cell
        }
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let index = self.topTab.selectedSegmentIndex
        switch index {
        case 0:
            return TitleHeaderCell.getHeight()
        case 1:
            return TitleHeaderCell.getHeight()
        default:
            return HeaderClasifCell.getHeight()
        }
    }
    
    
    //change cell for each header
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: nil)
        let index = self.topTab.selectedSegmentIndex
        
        switch index{
        case 0:
            let headerView = tableView.dequeueReusableCellWithIdentifier("titleHeaderCell") as! TitleHeaderCell
            headerView.refreshView(futureMatches?.weeks[section])
            return headerView
        case 1:
            let headerView = tableView.dequeueReusableCellWithIdentifier("titleHeaderCell") as! TitleHeaderCell
            headerView.refreshView(pastMatches?.weeks[section])
            return headerView
        default:
            var headerView = tableView.dequeueReusableCellWithIdentifier("clasifHeaderCell") as! HeaderClasifCell
            return headerView
        }
        
    }

}

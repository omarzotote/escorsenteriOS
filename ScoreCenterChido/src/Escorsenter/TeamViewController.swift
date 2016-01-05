//
//  TeamViewController.swift
//  Escorsenter
//
//  Created by Francisco Javier Gutierrez Gutierrez on 1/28/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import UIKit

class TeamViewController: UIViewController, ViewDelegate {

    var Team : TeamDto?
    var teamManager : TeamsManager?
    var scoreTableResultManager : ScoreTableResultsManager?
    
    let arr1 = ["Uno","Dos","Tres"]
    let arr2 = ["One","Two","Three","Four"]
    
    @IBOutlet var teamNameLabel: UILabel!
    @IBOutlet var teamPointsLabel: UILabel!
    @IBOutlet var teamLeagueLabel: UILabel!
    @IBOutlet var gamesLabel: UILabel!
    @IBOutlet var wonGamesLabel: UILabel!
    @IBOutlet var lostGamesLabel: UILabel!
    @IBOutlet var drawnGamesLabel: UILabel!
    @IBOutlet var goalsScoredLabel: UILabel!
    @IBOutlet var goalsAgainstLabel: UILabel!
    @IBOutlet var differenceLabel: UILabel!
    @IBOutlet var pointsLabel: UILabel!
    
    
    @IBOutlet var favoriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let topItem = navigationController?.navigationBar.topItem
        topItem!.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
        
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.title = Team!.name
        teamNameLabel.text = Team!.name
        teamManager = TeamsManager()
        self.scoreTableResultManager = ScoreTableResultsManager()
        self.scoreTableResultManager?.getScoreTableResultFromAPI(self, id: self.Team!.id)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        setButton()
    }
    
    //Favorites button methods
    
    func setButton(){
        if teamManager!.isFavorite(Team!.id){
            favoriteButton.setTitle("Quitar de favoritos", forState: UIControlState.Normal)
        }
        else{
            favoriteButton.setTitle("Añadir a favoritos", forState: UIControlState.Normal)
        }
    }
    
    @IBAction func favoriteButtonClicked(sender: AnyObject) {
        if teamManager!.isFavorite(Team!.id){
            teamManager!.removeFromFavorites(Team!.id)
        }
        else{
            teamManager!.addToFavorites(Team!.id)
        }
        setButton()
    }
    //Swipe down to refresh methods
    
    
    func RefreshView(obj: AnyObject, append: Int) {
        let scoreTableResult = obj as! ScoreTableResultDto
        
        teamPointsLabel.text = String(scoreTableResult.points) + " pts"
        
        gamesLabel.text = String(scoreTableResult.gamesPlayed)
        wonGamesLabel.text = String(scoreTableResult.gamesWined)
        lostGamesLabel.text = String(scoreTableResult.gamesLost)
        drawnGamesLabel.text = String(scoreTableResult.gamesDrawn)
        goalsScoredLabel.text = String(scoreTableResult.scoreFavor)
        goalsAgainstLabel.text = String(scoreTableResult.scoreAgainst)
        differenceLabel.text = String(scoreTableResult.scoreDifference)
        pointsLabel.text = String(scoreTableResult.points)
    }

}

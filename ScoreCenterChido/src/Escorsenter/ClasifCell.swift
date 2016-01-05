//
//  ClasifCell.swift
//  Escorsenter
//
//  Created by EnCalientesMacdonalds on 11/3/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import UIKit

class ClasifCell: UITableViewCell {
    
    @IBOutlet var teamNameLabel: UILabel!
    @IBOutlet var playedGamesLabel: UILabel!
    @IBOutlet var wonGamesLabel: UILabel!
    @IBOutlet var tiedGamesLabel: UILabel!
    @IBOutlet var lostGamesLabel: UILabel!
    @IBOutlet var scoreFavorLabel: UILabel!
    @IBOutlet var scoreAgainstLabel: UILabel!
    @IBOutlet var scoreDifferenceLabel: UILabel!
    @IBOutlet var pointsLabel: UILabel!
    
    static func getHeight() -> CGFloat {
        return 32
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func refreshView(scoreTableResult: ScoreTableResultDto?) {
        teamNameLabel.text = scoreTableResult!.team.name
        playedGamesLabel.text = String(scoreTableResult!.gamesPlayed)
        wonGamesLabel.text = String (scoreTableResult!.gamesWined)
        tiedGamesLabel.text = String (scoreTableResult!.gamesDrawn)
        lostGamesLabel.text = String (scoreTableResult!.gamesLost)
        scoreFavorLabel.text = String(scoreTableResult!.scoreFavor)
        scoreAgainstLabel.text = String(scoreTableResult!.scoreAgainst)
        scoreDifferenceLabel.text = String(scoreTableResult!.scoreDifference)
        pointsLabel.text = String (scoreTableResult!.points)
    }
    
   
    
}

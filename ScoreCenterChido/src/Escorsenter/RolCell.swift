//
//  RolCell.swift
//  Escorsenter
//
//  Created by En Calientes Mac 2 on 29/10/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import UIKit

class RolCell: UITableViewCell {

    @IBOutlet var team1NameLabel: UILabel!
    @IBOutlet var team2NameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    static func getHeight() -> CGFloat {
        return 80
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func refreshView(match: MatchDto?) {
        if(match == nil) {
            return
        }
        team1NameLabel.text = match!.team1.name
        team2NameLabel.text = match!.team2.name
        dateLabel.text = match!.date
    }
    
}

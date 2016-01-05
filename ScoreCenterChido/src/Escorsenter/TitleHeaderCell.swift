//
//  TitleHeaderCell.swift
//  Escorsenter
//
//  Created by Jose Miguel Arreola on 2/13/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import UIKit

class TitleHeaderCell: UITableViewCell {

    @IBOutlet var dateRolLabel: UILabel!
    @IBOutlet var cyanDateImage: UIImageView!
    
    static func getHeight() -> CGFloat {
        return 30
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cyanDateImage.layer.cornerRadius = 10
        cyanDateImage.clipsToBounds = true
        self.cyanDateImage.image = self.cyanDateImage.image!.imageWithColor(UIColor(red:118.0/255.0, green:188.0/255.0,blue:128.0/255.0,alpha:1.0)).imageWithRenderingMode(.AlwaysOriginal)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func refreshView(week: WeekDto?){
        if (week == nil) {
            return
        }
        dateRolLabel.text = week!.title
    }
    
}

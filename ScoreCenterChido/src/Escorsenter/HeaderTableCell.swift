//
//  HeaderTableCell.swift
//  Escorsenter
//
//  Created by Jose Miguel Arreola on 2/12/15.
//  Copyright (c) 2015 En Calientes Labs. All rights reserved.
//

import UIKit

class HeaderTableCell: UITableViewCell {

    @IBOutlet var headerBackgroundimage: UIImageView!
    @IBOutlet var headerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.headerBackgroundimage.layer.cornerRadius = 10
        self.headerBackgroundimage.clipsToBounds = true
        self.headerBackgroundimage.image = self.headerBackgroundimage.image!.imageWithColor(UIColor(red:118.0/255.0, green:188.0/255.0,blue:128.0/255.0,alpha:1.0)).imageWithRenderingMode(.AlwaysOriginal)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

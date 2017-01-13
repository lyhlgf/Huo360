//
//  NewsViewCell.swift
//  Huo360
//
//  Created by Cloud on 17/1/13.
//  Copyright © 2017年 Cloud. All rights reserved.
//

import UIKit

class NewsViewCell: UITableViewCell {

    // UI Properties
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

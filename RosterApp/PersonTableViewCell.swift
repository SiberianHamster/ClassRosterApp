//
//  PersonTableViewCell.swift
//  RosterApp
//
//  Created by Mark Lin on 3/11/15.
//  Copyright (c) 2015 Mark Lin. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
  
    @IBOutlet weak var FirstNameLabel: UILabel!

    @IBOutlet weak var LastNameLabel: UILabel!
  
    @IBOutlet weak var PictureImage: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

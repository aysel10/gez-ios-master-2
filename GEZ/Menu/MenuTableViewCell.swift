//  MenuTableViewCell.swift
//  GEZ
//
//  Created by Ayselkas on 6/30/18.
//  Copyright © 2018 IceL. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

   
    @IBOutlet weak var menuIcon: UIImageView!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

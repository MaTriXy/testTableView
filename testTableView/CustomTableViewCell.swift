//
//  CustomTableViewCell.swift
//  testTableView
//
//  Created by Romain Cardona on 05/04/2018.
//  Copyright © 2018 Romain Cardona. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var gens: UILabel!
    @IBOutlet weak var gens2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

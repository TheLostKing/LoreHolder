//
//  LoreTableViewCell.swift
//  LoreHolder
//
//  Created by Zachary Calderone on 3/4/18.
//  Copyright © 2018 Black Kobold Games. All rights reserved.
//

import UIKit

class LoreTableViewCell: UITableViewCell {
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var smallDescriptor: UILabel!
    @IBOutlet weak var ImagePreview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

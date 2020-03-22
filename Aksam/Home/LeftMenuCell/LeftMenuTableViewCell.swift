//
//  LeftMenuTableViewCell.swift
//  Aksam
//
//  Created by emirhan battalbaş on 22.03.2020.
//  Copyright © 2020 emirhan battalbaş. All rights reserved.
//

import UIKit

class LeftMenuTableViewCell: UITableViewCell,Reusable {

    static var nib: UINib {
        return UINib(nibName: String(describing: LeftMenuTableViewCell.self), bundle: nil)
    }
    
    // Label
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

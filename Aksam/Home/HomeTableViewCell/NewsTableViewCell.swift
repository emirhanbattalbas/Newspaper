//
//  NewsTableViewCell.swift
//  Aksam
//
//  Created by emirhan battalbaş on 22.03.2020.
//  Copyright © 2020 emirhan battalbaş. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    static var nib: UINib {
        return UINib(nibName: String(describing: NewsTableViewCell.self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var bgView: UIView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

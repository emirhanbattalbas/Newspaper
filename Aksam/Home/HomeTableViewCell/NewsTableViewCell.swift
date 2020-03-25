//
//  NewsTableViewCell.swift
//  Aksam
//
//  Created by emirhan battalbaş on 22.03.2020.
//  Copyright © 2020 emirhan battalbaş. All rights reserved.
//

import UIKit
import SDWebImage

class NewsTableViewCell: UITableViewCell, Reusable {

    static var nib: UINib {
        return UINib(nibName: String(describing: NewsTableViewCell.self), bundle: nil)
    }
    
    @IBOutlet weak var bgView: UIView!

    @IBOutlet var newsImagesViewArray: [UIImageView]!
    
    @IBOutlet var newsTitleLabelArray: [UILabel]!
    
    @IBOutlet weak var newsTypeTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        shadowViewConfigure()
        
        // Initialization code
    }
    
    func configure(viewModel: NewsTableViewCell.ViewModel) {
                
        newsTypeTitleLabel.text = viewModel.newsTypeTitle
        
        for index in 0..<viewModel.itemList.count {
            newsImagesViewArray[index].sd_setImage(with: URL(string: viewModel.itemList[index].imageURL), completed: nil)
            newsTitleLabelArray[index].text = viewModel.itemList[index].title
        }
    }
    
    fileprivate func shadowViewConfigure() {
        bgView.layer.shadowColor = UIColor.lightGray.cgColor
        bgView.layer.shadowOffset = .zero
        bgView.layer.shadowRadius = 10.0
        bgView.layer.shadowOpacity = 1
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension NewsTableViewCell {
    
    struct ViewModel {
        var itemList: [ItemList] = []
        var newsTypeTitle: String
    }
}



extension NewsTableViewCell.ViewModel {
    
    init(data: [ItemList], newsTypeTitle: String) {
        self.itemList = data
        self.newsTypeTitle = newsTypeTitle
    }
}

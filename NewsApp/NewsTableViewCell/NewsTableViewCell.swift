//
//  NewsTableViewCell.swift
//  NewsApp
//
//  Created by CMP2024008 on 15/11/24.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    static let identifier = "NewsTableViewCell"
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override required init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(with item: NewsItem) {
        newsImageView.layer.cornerRadius = 5.0
        newsImageView.clipsToBounds = true
        
        titleLabel.text = item.title
        contentLabel.text = item.content
        dateLabel.text = item.publishedAt + item.updatedAt
    }
}

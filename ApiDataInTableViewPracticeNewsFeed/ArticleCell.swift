//
//  ArticleCell.swift
//  ApiDataInTableViewPracticeNewsFeed
//
//  Created by Srikanth Kyatham on 12/3/24.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var sourceName: UILabel!
    

    @IBOutlet weak var articleDescription: UILabel!
    
    
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var publishedAt: UILabel!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var sourceId: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(from article: Article) {
        sourceName.text = "Source Name: \(article.source?.name ?? "")"
        sourceId.text = "Source Id: \(article.source?.id ?? "Null")"
        author.text = "Author: \(article.author ?? "Null")"
        title.text = "Title: \(article.title ?? "Null")"
        publishedAt.text = "Published At: \(article.publishedAt ?? "Null")"
        articleDescription.text = "Description: \(article.description ?? "Null")"
        content.text = "Content: \(article.content ?? "Null")"
    }

}

//
//  ViewController.swift
//  ApiDataInTableViewPracticeNewsFeed
//
//  Created by Srikanth Kyatham on 12/3/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var totalResultsLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    var newsFeed : NewsFeed? = nil
    var articles : [Article] = []
    
    var url = "https://gist.githubusercontent.com/congsun/600f3ad57298f9dbc23fedf6b2b25450/raw/73d7a8ed589652339ae3646d0a595298ce5e72c2/newsFeed.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 225
        
        getData()
        
    }
    func getData(){
        let sharedInstance = Network.sharedInstance
        sharedInstance.getData(from: url)  { [weak self] NewsFeed in
            DispatchQueue.main.async {
                guard let NewsFeed else { return }
                self?.newsFeed = NewsFeed
                self?.articles = self?.newsFeed?.articles ?? []
                self?.totalResultsLabel.text = "Total Results : \(self?.newsFeed?.totalResults ?? 0)"
                self?.statusLabel.text = self?.newsFeed?.status
                self?.tableView.reloadData()
            }
        }
    }

}

extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        
        let article = articles[indexPath.row]
        cell.config(from: article)
        return cell
    }
}

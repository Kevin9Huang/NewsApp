//
//  ViewController.swift
//  NewsApp
//
//  Created by CMP2024008 on 15/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var newsItems: [NewsItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "News"
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsTableViewCell")
        loadData()
    }
    
    private func loadData() {
        if let fileURL = Bundle.main.url(forResource: "response", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                newsItems = try decoder.decode([NewsItem].self, from: data)
                tableView.reloadData()
            } catch {
                print("Failed to load JSON: \(error)")
            }
        } else {
            print("File not found in bundle")
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        let newsItem = newsItems[indexPath.row]
        cell.configure(with: newsItem)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}




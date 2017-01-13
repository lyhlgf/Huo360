//
//  FirstViewController.swift
//  Huo360
//
//  Created by Cloud on 17/1/8.
//  Copyright © 2017年 Cloud. All rights reserved.
//

import UIKit

class NewsViewController: UITableViewController {

    // The news cell property
    fileprivate var newsCells = [HuoNewsCell]()
    fileprivate var currentTableView = UITableView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNewsCell()
        //print(crawler.getWebPage().getString())
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsCells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        currentTableView = tableView
        let cellIdentifier = "NewsViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NewsViewCell
        let newsCell = newsCells[indexPath.row]
        cell.newsTitle.text = newsCell.getTitle()
        cell.newsImage.downloadedFrom(url: newsCell.getImgUrl())
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cell2Article" {
            let dest = segue.destination as! NewsArticleViewController
            let currentRow = currentTableView.indexPathForSelectedRow
            let currentCell = newsCells[(currentRow?.row)!]
            dest.setArticleUrl(url: currentCell.getHref())
        }
    }
    
    private func loadNewsCell() {
        let crawler = Crawler(urlStr: "http://huo360.com", objectKind: "newsCell")
        crawler.httpGetWebPage()
        crawler.parseHtml()
        newsCells = crawler.getParse2HuoObj().getNewsCells()
    }
    
    @IBAction func refreshNews(_ sender: Any) {
        loadNewsCell()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


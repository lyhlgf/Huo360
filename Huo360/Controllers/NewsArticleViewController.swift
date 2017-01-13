//
//  NewsDetailViewController.swift
//  Huo360
//
//  Created by Cloud on 17/1/13.
//  Copyright © 2017年 Cloud. All rights reserved.
//

import UIKit

class NewsArticleViewController: UIViewController {

    fileprivate var newsArticle = HuoNewsArticle()
    fileprivate var articleUrl = ""
    
    @IBOutlet weak var articleImg: UIImageView!
    @IBOutlet weak var articleText: UILabel!
    @IBOutlet weak var articleAuthor: UILabel!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNewsArticle()
        //print(articleUrl)
        // Do any additional setup after loading the view.
    }

    func setArticleUrl(url: String) {
        articleUrl = url
    }
    
    func loadNewsArticle() {
        let crawler = Crawler(urlStr: articleUrl, objectKind: "newsArticle")
        crawler.httpGetWebPage()
        crawler.parseHtml()
        newsArticle = crawler.getParse2HuoObj().getNewsArticles()
        articleImg.downloadedFrom(url: newsArticle.getImgUrl())
        articleTitle.text = newsArticle.getTitle()
        articleAuthor.text = newsArticle.getAuthor()
        articleText.text = newsArticle.getParagraphs()
        articleTime.text = newsArticle.getTime()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

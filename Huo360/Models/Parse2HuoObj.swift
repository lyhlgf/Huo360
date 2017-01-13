//
//  ParseConfig.swift
//  Huo360
//
//  Created by Cloud on 17/1/11.
//  Copyright © 2017年 Cloud. All rights reserved.
//

import Foundation
import Fuzi

class Parse2HuoObj {
    // objectKind decide by the web page's type, it mark the entry of needed label
    fileprivate let objectKind: String
    fileprivate let kindStr: String
    fileprivate var need: Dictionary<String, (String, String)>
    fileprivate var newsCells: [HuoNewsCell]
    fileprivate var newsArticle: HuoNewsArticle
    fileprivate var TVCells: [HuoTVCell]
    fileprivate var TVDetails: [HuoTVDetail]
    
    init(objectKind: String) {
        var kind = String()
        self.need = Dictionary<String, (String, String)>()
        switch objectKind {
        case "newsCell":
            kind = "//div[@class='m_news']"
            need = ["href": ("//a", "href"), "imgUrl": ("//img", "src"), "title": ("//img", "title")]
        case "newsArticle":
            kind = "//div[@class='news-a']"
            need = ["title": ("//h1", "text"), "imgUrl": ("//div[@class='na_text']/p/img", "src"), "author": ("//b/a", "text"), "time": ("//div[@class='media-body']/span", "text"),  "paragraphs": ("//div[@class='na_text']", "text")]
        case "TVCell":
            kind = "//div[@class='rowL']"
        case "TVDetail":
            kind = "//div[@id='sub_head']"
        default: break
            
        }
        self.kindStr = objectKind
        self.objectKind = kind
        self.newsCells = []
        self.newsArticle = HuoNewsArticle()
        self.TVCells = []
        self.TVDetails = []
    }
    
    func getObjectKind() -> String {
        return objectKind
    }
    
    func getNewsCells() -> [HuoNewsCell] {
        return newsCells
    }
    
    func getNewsArticles() -> HuoNewsArticle {
        return newsArticle
    }
    
    func getNeed() -> Dictionary<String, (String, String)> {
        return need
    }
    
    func parse2Object(needStr: Dictionary<String, String>) {
        switch kindStr {
        case "newsCell":
            parse2NewsCell(needStr: needStr)
        case "newsArticle":
            parse2NewsArticle(needStr: needStr)
        case "TVCell":
            parse2TVCell(needStr: needStr)
        case "TVDetail":
            parse2TVDetail(needStr: needStr)
        default: break
        }
    }
    
    fileprivate var title = ""
    fileprivate var imgUrl = ""
    fileprivate var href = ""
    fileprivate var author = ""
    fileprivate var time = ""
    fileprivate var paragraphs = ""
    fileprivate var score = ""
    fileprivate var year = ""
    fileprivate var television = ""
    fileprivate var englishTitle = ""
    fileprivate var watching = ""
    fileprivate var status = ""
    fileprivate var kind = ""
    fileprivate var introduce = ""
    
    fileprivate func parse2NewsCell(needStr: Dictionary<String, String>) {
        
        for (needMember, needValue) in needStr {
            switch needMember {
            case "href":
                href = "http://huo360.com" + needValue
            case "imgUrl":
                imgUrl = "http://huo360.com" + needValue
            case "title":
                title = needValue
            default:break
            }
        }
        let newsCell = HuoNewsCell(title: title, imgUrl: URL(string: imgUrl)!, href: href)
        newsCells.append(newsCell)
        
        title = ""
        href = ""
        imgUrl = ""
    }
    
    fileprivate func parse2NewsArticle(needStr: Dictionary<String, String>) {
        for (needMember, needValue) in needStr {
            switch needMember {
            case "imgUrl":
                imgUrl = "http://huo360.com" + needValue
            case "title":
                title = needValue
            case "time":
                time = needValue
            case "paragraphs":
                let whitespace = CharacterSet.whitespaces
                let tempArray = needValue.components(separatedBy: whitespace)
                for str in tempArray {
                    paragraphs += str
                }
            case "author":
                author = needValue
            default:break
            }
        }
        newsArticle = HuoNewsArticle(title: title, imgUrl: URL(string: imgUrl)!, author: author, time: time, paragraphs: paragraphs)
        //newsArticles.append(newsArticle)
        
        title = ""
        author = ""
        time = ""
        paragraphs = ""
        imgUrl = ""

    }
    
    fileprivate func parse2TVCell(needStr: Dictionary<String, String>) {
        
    }
    
    fileprivate func parse2TVDetail(needStr: Dictionary<String, String>) {
        
    }
}

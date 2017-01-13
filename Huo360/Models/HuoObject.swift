//
//  Huo.swift
//  Huo360
//
//  Created by Cloud on 17/1/11.
//  Copyright © 2017年 Cloud. All rights reserved.
//

import Foundation

// News module's base class
class HuoObject {
    fileprivate let title: String
    fileprivate let imgUrl: URL
    
    fileprivate init() {
        title = ""
        imgUrl = URL(string: "1")!
    }
    
    fileprivate init(title: String, imgUrl: URL) {
        self.title = title
        self.imgUrl = imgUrl
    }
    
    func getTitle() -> String {
        return title
    }
    
    func getImgUrl() -> URL {
        return imgUrl
    }
    
}

// The object stores a news cell
class HuoNewsCell: HuoObject {
    fileprivate let href: String
    
    override init() {
        self.href = ""
        super.init()
    }
    
    init(title: String, imgUrl: URL, href: String) {
        self.href = href
        super.init(title: title, imgUrl: imgUrl)
    }
    
    func getHref() -> String {
        return href
    }
}

// The object stores a news article
class HuoNewsArticle: HuoObject {
    fileprivate let author: String
    fileprivate let time: String
    fileprivate let paragraphs: String
    
    override init() {
        self.author = ""
        self.time = ""
        self.paragraphs = ""
        super.init()
    }
    
    init(title: String, imgUrl: URL, author: String, time: String, paragraphs: String) {
        self.author = author
        self.time = time
        self.paragraphs = paragraphs
        super.init(title: title, imgUrl: imgUrl)
    }
    
    func getAuthor() -> String {
        return author
    }
    
    func getTime() -> String {
        return time
    }
    
    func getParagraphs() -> String {
        return paragraphs
    }
}

// The object stores a TV cell
class HuoTVCell: HuoObject {
    fileprivate let href: URL
    fileprivate let score: String
    fileprivate let year: String
    fileprivate let television: String
    
    override init() {
        self.href = URL(string: "")!
        self.score = ""
        self.year = ""
        self.television = ""
        super.init()
    }
    
    init(title: String, imgUrl: URL, href: URL, score: String, year: String, television: String) {
        self.href = href
        self.score = score
        self.year = year
        self.television = television
        super.init(title: title, imgUrl: imgUrl)
    }
    
    func getHref() -> URL {
        return href
    }
    
    func getScore() -> String {
        return score
    }
    
    func getYear() -> String {
        return year
    }
    
    func getTelevision() -> String {
        return television
    }
}

// The object stores a TV detail
class HuoTVDetail: HuoObject {
    fileprivate let englishTitle: String
    fileprivate let score: String
    fileprivate let watching: String
    fileprivate let television: String
    fileprivate let year: String
    fileprivate let status: String
    fileprivate let kind: String
    fileprivate let introduce: String
    
    override init() {
        self.englishTitle = ""
        self.score = ""
        self.watching = ""
        self.year = ""
        self.television = ""
        self.status = ""
        self.kind = ""
        self.introduce = ""
        super.init()
    }
    
    init(title: String, imgUrl: URL, englishTitle: String, score: String, watching:String, year: String, television: String, status: String, kind: String, introduce: String) {
        self.englishTitle = englishTitle
        self.score = score
        self.watching = watching
        self.year = year
        self.television = television
        self.status = status
        self.kind = kind
        self.introduce = introduce
        super.init(title: title, imgUrl: imgUrl)
    }
 
    func getScore() -> String {
        return score
    }
    
    func getYear() -> String {
        return year
    }
    
    func getTelevision() -> String {
        return television
    }
    
    func getEnglishTitle() -> String {
        return englishTitle
    }
    
    func getWatching() -> String {
        return watching
    }
    
    func getStatus() -> String {
        return status
    }
    
    func getKind() -> String {
        return kind
    }

    func getIntroduce() -> String {
        return introduce
    }
}

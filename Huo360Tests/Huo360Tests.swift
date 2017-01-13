//
//  Huo360Tests.swift
//  Huo360Tests
//
//  Created by Cloud on 17/1/8.
//  Copyright © 2017年 Cloud. All rights reserved.
//

import UIKit
import XCTest
@testable import Huo360

class Huo360Tests: XCTestCase {
    
    func testCrawler() {
        let crawler = Crawler(urlStr: "http://huo360.com/a/45138", objectKind: "newsArticle")
        crawler.httpGetWebPage()
        crawler.parseHtml()
        //newsCells = crawler.getParse2HuoObj().getNewsCells()
    }
}

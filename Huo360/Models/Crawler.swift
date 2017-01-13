//
// Created by Cloud on 17/1/8.
// Copyright (c) 2017 Cloud. All rights reserved.
//

import Foundation

class Crawler {
    // Get a HTTP object
    fileprivate let http = HTTP()
    // Get a HTML Parser
    fileprivate var htmlParser: HTMLParser
    // The webPage this crawler deal with, store as Data
    fileprivate var webData: Data
    fileprivate var url: String
    fileprivate var parse2HuoObj: Parse2HuoObj
    
    // Init the crawler with url
    init(urlStr: String, objectKind: String) {
        url = urlStr
        webData = Data(nsStr: "")
        parse2HuoObj = Parse2HuoObj(objectKind: objectKind)
        htmlParser = HTMLParser(data: webData.getString(), parse2HuoObj: parse2HuoObj)
    }
    
    // Retuen the string of web page
    func getWebPage() -> Data {
        return webData
    }
    
    func getParse2HuoObj() -> Parse2HuoObj {
        return parse2HuoObj
    }
    
    // Send Get Method and store the result to webPage
    func httpGetWebPage() {
        http.httpGet(url)
        while !http.isResponseComplete() {
            
        }
        let webPage = http.getResponse()
        webData = Data(nsStr: webPage)
        //let close = CloseHTML()
        //webData = close.closeHTML(webData)
        //print(webData.getString())
        //closeHTML()
    }
    
    
//    func closeHTML() {
//        if webData.getString() == "" {
//            return
//        }
//        var str = webData.getString()
//        let range1 = str.rangeOfString("<body>")
//        let startIndex = range1.location
//        let range2 = str.rangeOfString("</body>")
//        let endIndex = range2.location + range2.length
//        let range = NSRange(location: startIndex, length: endIndex - startIndex)
//        str = str.substringWithRange(range)
//        webData = Data(nsStr: str)
//    }
    
    func parseHtml() {
        if webData.getString() == "" {
            return
        }
        //print(webData.getString())
        htmlParser = HTMLParser(data: webData.getString(), parse2HuoObj: parse2HuoObj)
        htmlParser.parse()
        //let newsCells = parse2HuoObj.getNewsCells()
        //for i in newsCells {
        //    print("\n\(i.getHref())\n")
        //}
    }
}

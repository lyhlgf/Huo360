//
//  HTMLParser.swift
//  Huo360
//
//  Created by Cloud on 17/1/9.
//  Copyright © 2017年 Cloud. All rights reserved.
//

import Foundation
import Fuzi

class HTMLParser {
    // Declare a parser
    //fileprivate var parser: XMLParser
    // Mutable array to store feed data
    //fileprivate var posts: NSMutableArray
    // Mutable dictionary to store elements
    //fileprivate var elements: NSMutableDictionary
    //fileprivate var element: NSString
    fileprivate var parse2HuoObj: Parse2HuoObj
    fileprivate var entry: Int
    
    fileprivate var doc: HTMLDocument
    
    init(data: String, parse2HuoObj: Parse2HuoObj) {
        //parser = XMLParser(data as String)
        //posts = NSMutableArray()
        //elements = NSMutableDictionary()
        //element = NSString()
        entry = 0
        doc = try! HTMLDocument(string: data)
        self.parse2HuoObj = parse2HuoObj
    }
    
    func parse() {
        //parser.parse()
        let objKind = parse2HuoObj.getObjectKind()
        let need = parse2HuoObj.getNeed()
        var result = Dictionary<String, String>()
        var elementCount = 0
        for element in doc.xpath(objKind) {
            //print(element)
            elementCount += 1
            for (needMember, (needXpath, needAttr)) in need {
                //let child = element.children(tag: needTag)[0]
                //let currentXpath = element.eval(xpath: objKind as String)?.stringValue
                //print(currentXpath)
                var needStr = ""
                let absoluteXpath = objKind + String("[\(elementCount)]") + needXpath
                switch needAttr {
                case "text":
                    //needStr = (element.eval(xpath: absoluteXpath)?.stringValue)!
                    let needElement = element.firstChild(xpath: absoluteXpath)
                    let childNodes = needElement?.childNodes(ofTypes: [.Element, .Text])
                    for node in childNodes! {
                        //print(node.stringValue)
                        needStr += node.stringValue
                    }
                    //print(childNodes)
                default:
                    let needElement = element.firstChild(xpath: absoluteXpath)
                    needStr = (needElement?.attr(needAttr))!
                }
                //print(needStr)
                result[needMember] = needStr
            }
            //print(result)
            parse2HuoObj.parse2Object(needStr: result)
        }
//
  //      if objKind[0].isEqualToString(elementName) && objKind[2].isEqualToString(attributeDict[objKind[1] as String]!) {
//            entry += 1
  //      } else if(entry > 0) {
    //        entry += 1
      //      parse2HuoObj.parse2Object(elementName, namespaceURI: namespaceURI, qName: qName, attributeDict: attributeDict)
        //}

    }
    
    func parseDetail(element: XMLElement) {
        
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
//        let objKind = parse2HuoObj.getObjectKind()
//        print(objKind)
        print(elementName)
        print(attributeDict)
//        if objKind[0].isEqualToString(elementName) && objKind[2].isEqualToString(attributeDict[objKind[1] as String]!) {
//            entry += 1
//        } else if(entry > 0) {
//            entry += 1
//            parse2HuoObj.parse2Object(elementName, namespaceURI: namespaceURI, qName: qName, attributeDict: attributeDict)
//        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
//        if entry > 0 {
//            entry -= 1
//        }
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print("parseErrorOccurred: \(parseError)")
    }
}

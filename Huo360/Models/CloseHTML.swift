//
//  CloseHTML.swift
//  Huo360
//
//  Created by Cloud on 17/1/12.
//  Copyright © 2017年 Cloud. All rights reserved.
//

import Foundation

class CloseHTML {
    fileprivate var stack = [String]()
    //private var indexStack = [Int]()
    
    func closeHTML(_ data: Data) -> Data {
        var webStr = data.getString() as String
        var tag = ""
        var tagAdd = false
        var count = 0
        //var begin = 0
        for i in webStr.characters {
            if i == "<" {
                tagAdd = true
                //begin = count
            }
            if tagAdd {
                tag += String(i)
            }
            if i == ">" {
                //print("\n\n\n\(tag)\n\n\n")
                tagAdd = false
                //print(tag)
                if tag.hasPrefix("<!--") && !tag.hasSuffix("-->") {
                    tagAdd = true
                    continue
                } else if tag.hasPrefix("<!--") && tag.hasSuffix("-->") {
                    tag = ""
                    continue
                }
                
                let space = tag.characters.index(of: " ")
                if space != nil {
                    tag = (tag.substring(to: space!)) + ">"
                }

                if tag.hasPrefix("</") {
                    //print("\n\(tag)")
                    //print("\(stack)\n")
                    var tempTag = tag
                    tempTag.remove(at: tempTag.characters.index(tempTag.startIndex, offsetBy: 1))
                    
                    while tempTag != stack.last && stack.count > 0 {
                        var notClose = stack.popLast()
                        //stack.removeLast()
                        //print(stack)
                        //let notCloseIndex = indexStack.popLast()
                        if notClose == "" {
                            continue
                        }
                        notClose = notClose?.insert("/", ind: 1)
                        //print("\n\n\n\(tag)\n\n\n")
                        //print("\n\n\n\(notClose)\n\n\n")
                        //let pos = webStr.characters.count - (<#T##String.CharacterView corresponding to your index##String.CharacterView#>.distance(from: (webStr.range(of: tag)?.lowerBound)!, to: webStr.endIndex))
                        //print(tag)
                        //webStr = webStr.insert((notClose)!, ind: pos)
                        //print("\n\(tag)")
                        //print("\(notClose)\n")
                        //begin += (notClose?.characters.count)!
                    }
                    //stack.popLast()
                } else {
                    //indexStack.append(begin)
                    stack.append(tag)
                }
                tag = ""
            }
            count += 1
        }
        //print("\n\n\n\(webStr)\n\n\n")
        let newData = Data(nsStr: webStr)
        return newData
    }
}

extension String {
    func insert(_ string:String,ind:Int) -> String {
        
        return  String(self.characters.prefix(ind)) + string + String(self.characters.suffix(self.characters.count-ind))
    }
}

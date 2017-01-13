//
//  Data.swift
//  Huo360
//
//  Created by Cloud on 17/1/11.
//  Copyright © 2017年 Cloud. All rights reserved.
//

import Foundation

class Data {
    fileprivate var nsStr: String
    fileprivate var nsData: Foundation.Data
    
    // transfer String to NSData
    init(nsStr: String) {
        self.nsStr = nsStr
        self.nsData = nsStr.data(using: .utf8)!
    }
    
    // transfer NSData to String
    init(nsData: Foundation.Data) {
        self.nsData = nsData
        self.nsStr = String(data: nsData, encoding: .utf8)!
    }
    
    // get NSData
    func getData() -> Foundation.Data {
        return nsData
    }
    
    // get String
    func getString() -> String {
        return nsStr
    }
}

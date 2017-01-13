//
//  HTTP.swift
//  Huo360
//
//  Created by Cloud on 17/1/9.
//  Copyright © 2017年 Cloud. All rights reserved.
//

import Foundation

class HTTP {
    // The response result of HTTP
    fileprivate var result: String = ""
    // If response is complete
    fileprivate var responseComplete = false
    
    func isResponseComplete() -> Bool {
        return responseComplete
    }
    
    func getResponse() -> String {
        return result
    }
    
    // Send a HTTP GET Method to url
    func httpGet(_ urlStr: String) {
        let url = URL(string: urlStr)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: {
            (data, response, error) in
            if error != nil {
                print("error=\(error)")
                return
            }
            
            self.result = String(data: data!, encoding: .utf8)!
            self.responseComplete = true
        })
        
        self.responseComplete = false
        task.resume()
    }

    
}

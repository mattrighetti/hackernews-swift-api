//
//  File.swift
//  
//
//  Created by Mattia Righetti on 06/08/21.
//

import Foundation

extension URLRequest {
    init(method: String, urlString string: String, withData data: Data) {
        self.init(url: URL(string: string)!, timeoutInterval: 10)
        self.httpMethod = method
        //self.httpShouldHandleCookies = true
        self.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        //self.addValue("gzip, deflate, br", forHTTPHeaderField: "Accept-Encoding")
        //self.addValue("text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8", forHTTPHeaderField: "Accept")
        self.httpBody = data
    }
}

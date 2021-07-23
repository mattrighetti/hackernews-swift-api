//
//  File.swift
//  
//
//  Created by Mattia Righetti on 23/07/21.
//

import Foundation

extension Data {
    var string: String? {
        String(data: self, encoding: .utf8)
    }
}

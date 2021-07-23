//
//  File.swift
//  
//
//  Created by Mattia Righetti on 22/07/21.
//

import Foundation

public struct User: Decodable {
    public let id: String
    public let created: Int
    public let karma: Int
    public let about: String?
    public let submitted: [Int]?
}

//
//  File.swift
//  
//
//  Created by Mattia Righetti on 22/07/21.
//

import Foundation

public struct User: Decodable {
    public var id: String?
    public var created: Int?
    public var karma: Int? = 0
    public var about: String? = ""
    public var submitted: [Int]? = []
}

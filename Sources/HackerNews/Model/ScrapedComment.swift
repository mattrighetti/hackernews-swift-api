//
//  File.swift
//  
//
//  Created by Mattia Righetti on 01/08/21.
//

import Foundation

public struct ScrapedComment {
    public var id: Int
    public var text: String?
    public var by: String?
    public var time: String?
    public var indentLevel: Int
    public var parsedText: String?
    
    public mutating func setParsedText(text: String) {
        parsedText = text
    }
}

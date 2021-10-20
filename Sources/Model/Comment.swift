//===----------------------------------------------------------------------===//
//
// This source file is part of the Hacker News API Swift open source project
//
// Copyright (c) 2021 Mattia Righetti. All rights reserved.
//
//===----------------------------------------------------------------------===//

import Foundation

/// Hacker News Comment struct representation
public struct Comment {
    
    /// Comment id
    public var id: Int
    
    /// Comment text in HTML
    public var text: String?
    
    /// Username of the comment's user
    public var by: String?
    
    /// Creation date of the item, in Unix Time.
    public var time: String?
    
    /// Comment indentation level
    public var indentLevel: Int
    
    /// Comment text parsed into representable String
    public var parsedText: NSAttributedString?
}

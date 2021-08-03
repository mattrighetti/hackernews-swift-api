//===----------------------------------------------------------------------===//
//
// This source file is part of the Hacker News API Swift open source project
//
// Copyright (c) 2021 Mattia Righetti. All rights reserved.
//
//===----------------------------------------------------------------------===//

import Foundation

/// Hacker News User struct representation
public struct User: Decodable {
    
    /// The user's unique username. Case-sensitive.
    public var id: String
    
    /// Creation date of the user, in Unix Time.
    public var created: Int?
    
    /// The user's karma.
    public var karma: Int? = 0
    
    /// The user's optional self-description. HTML.
    public var about: String?
    
    /// List of the user's stories, polls and comments.
    public var submitted: [Int]? = []
    
    /// Link to user threads/activity
    public var threadsUrl: URL {
        HackerNews.WebsiteURL.threads(id).url
    }
}

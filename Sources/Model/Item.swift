//===----------------------------------------------------------------------===//
//
// This source file is part of the Hacker News API Swift open source project
//
// Copyright (c) 2021 Mattia Righetti. All rights reserved.
//
//===----------------------------------------------------------------------===//

import Foundation

/// Stories, comments, jobs, Ask HNs and even polls are items. They're identified by their ids, which are unique integers.
public struct Item: Decodable {
    
    /// The item's unique id
    public let id: Int
    
    /// `true` if the item is deleted.
    public let deleted: Bool?
    
    /// The type of item. One of "job", "story", "comment", "poll", or "pollopt".
    public let type: ItemType?
    
    /// The username of the item's author.
    public let by: String?
    
    /// Creation date of the item, in Unix Time.
    public let time: Int?
    
    /// The comment, story or poll text. HTML.
    public let text: String?
    
    /// `true` if the item is dead.
    public let dead: Bool?
    
    /// The comment's parent: either another comment or the relevant story.
    public let parent: Int?
    
    /// The pollopt's associated poll.
    public let poll: Bool?
    
    /// The ids of the item's comments, in ranked display order.
    public let kids: [Int]?
    
    /// The URL of the story.
    public let url: String?
    
    /// The story's score, or the votes for a pollopt.
    public let score: Int?
    
    /// The title of the story, poll or job. HTML.
    public let title: String?
    
    /// A list of related pollopts, in display order.
    public let parts: Int?
    
    /// In the case of stories or polls, the total comment count.
    public let descendants: Int?
    
    /// Website hostname
    public var urlHost: String? {
        guard let url = url else { return nil }
        var hostString = URL(string: url)!.host!
        if hostString.contains("www.") {
            hostString.removeFirst(4)
        }
        return hostString
    }
    
    public enum ItemType: String, Decodable {
        case poll
        case job
        case story
        case comment
        case pollopt
    }
}

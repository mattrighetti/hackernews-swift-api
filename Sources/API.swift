//===----------------------------------------------------------------------===//
//
// This source file is part of the Hacker News API Swift open source project
//
// Copyright (c) 2021 Mattia Righetti. All rights reserved.
//
//===----------------------------------------------------------------------===//

import Foundation

/// HackerNews endpoint data structure
public struct HackerNews {
    public static let endpoint = "https://hacker-news.firebaseio.com/v0"

    /// HackerNews REST API methods
    public enum API {
        /// HackerNews User REST API methods
        public enum User {
            case id(String)
            
            public var urlString: String {
                switch self {
                case .id(let userId):
                    return "\(HackerNews.endpoint)/user/\(userId).json"
                }
            }
        }

        /// HackerNews Stories REST API methods
        public enum Stories: String {
            case top
            case new
            case best
            case ask
            case job
            case show
        }

        /// HackerNews Item REST API methods
        public enum Item {
            case id(Int)
            
            public var urlString: String {
                switch self {
                case .id(let storyId):
                    return "\(HackerNews.endpoint)/item/\(storyId).json"
                }
            }
        }
    }
    
    public enum WebsiteURL {
        case item(Int, Int)
        case threads(String)
        
        public var url: URL {
            var components = URLComponents()
            components.scheme = "https"
            components.host = "news.ycombinator.com"
            
            switch self {
            case .item(let itemId, let page):
                components.path = "/item"
                components.queryItems = [
                    URLQueryItem(name: "id", value: String(itemId))
                ]
                
                if page != 0, page != 1 {
                    components.queryItems!.append(URLQueryItem(name: "p", value: String(page)))
                }
            case .threads(let username):
                components.path = "/threads"
                components.queryItems = [
                    URLQueryItem(name: "id", value: username)
                ]
            }
            return components.url!
        }
    }
}

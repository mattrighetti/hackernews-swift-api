//
//  HackerNes.swift
//  HNReader
//
//  Created by Mattia Righetti on 23/07/21.
//

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
            
            public var urlString: String {
                "\(HackerNews.endpoint)/\(self.rawValue)stories.json"
            }
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
}

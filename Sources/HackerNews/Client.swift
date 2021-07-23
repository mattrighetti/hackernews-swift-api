//
//  File.swift
//  
//
//  Created by Mattia Righetti on 22/07/21.
//

import Foundation
import Combine
import Firebase

/// HackerNews Client that exposes methods to get users, items and stories from https://news.ycombinator.com
public class HackerNewsClient {
    private let session: URLSession = URLSession.shared
    private let ref: DatabaseReference!
    
    public init(app: FirebaseApp?) {
        FirebaseApp.configure()
        ref = Database.database().reference().child("v0")
    }
    
    /// Retrieves user  from HackerNews
    public func getUser(withId id: String, completionHandler: @escaping (User) -> Void) {
        URLSession.request(urlString: HackerNews.API.User.id(id).urlString, type: User.self) { user in
            completionHandler(user)
        }
    }
    
    /// Retrieves item from HackerNews
    public func getItem(withId id: Int, completionHandler: @escaping (Item) -> Void) {
        URLSession.request(urlString: HackerNews.API.Item.id(id).urlString, type: Item.self) { item in
            completionHandler(item)
        }
    }
    
    /// Retrieves array of items from HackerNews
    ///
    /// You can specify which kind of stories you would like to retrieve:
    ///   - `top`
    ///   - `best`
    ///   - `new`
    public func getStoriesId(by api: HackerNews.API.Stories, completionHandler: @escaping ([Int]) -> Void) {
        URLSession.request(urlString: api.urlString, type: [Int].self) { storiesIds in
            completionHandler(storiesIds)
        }
    }
    
    /// Recursively fetches comments and all its childrens
    public func getComments(commentsIds: [Int], completionHandler: @escaping (Bool, [Comment]) -> Void) {
        var returnComments : [Comment] = []
                
        let commentsGroup = DispatchGroup()
        for commentId in commentsIds {
            commentsGroup.enter()
            URLSession.request(urlString: HackerNews.API.Item.id(commentId).urlString, type: Comment.self) { comment in
                comment.getComments { success in
                    returnComments.append(comment)
                    commentsGroup.leave()
                }
            }
        }
        
        commentsGroup.notify(queue: .main) {
            returnComments.sort { a, b in
                commentsIds.firstIndex(of: a.id!)! < commentsIds.firstIndex(of: b.id!)!
            }
            completionHandler(true, returnComments)
        }
    }
}

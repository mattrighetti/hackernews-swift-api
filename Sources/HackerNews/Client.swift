//
//  File.swift
//  
//
//  Created by Mattia Righetti on 22/07/21.
//

import Foundation
import Combine
import Firebase
import OSLog

/// HackerNews Client that exposes methods to get users, items and stories from https://news.ycombinator.com
public class HackerNewsClient {
    public static let shared: HackerNewsClient = HackerNewsClient()
    private let session: URLSession = URLSession.shared
    public let ref: DatabaseReference!
    
    private init() {
        FirebaseApp.configure()
        ref = Database.database().reference().child("v0")
    }
    
    /// Retrieves user  from HackerNews
    public func getUser(withId id: String, completionHandler: @escaping (User) -> Void) {
        ref.child("user/\(id)").getData { error, snapshot in
            NSLog("Checking for data error")
            guard let data = snapshot.data else { return }
            do {
                NSLog("Trying to decode data")
                let user = try JSONDecoder().decode(User.self, from: data)
                NSLog("Running completion handler")
                completionHandler(user)
            } catch {
                NSLog("Catching error while decoding: \(error)")
            }
        }
    }
    
    /// Retrieves item from HackerNews
    public func getItem(withId id: Int, completionHandler: @escaping (Item) -> Void) {
        ref.child("item/\(id)").getData { error, snapshot in
            guard let data = snapshot.data else { return }
            do {
                let user = try JSONDecoder().decode(Item.self, from: data)
                completionHandler(user)
            } catch {
                print(error)
            }
        }
    }
    
    /// Retrieves array of items from HackerNews
    ///
    /// You can specify which kind of stories you would like to retrieve:
    ///   - `top`
    ///   - `best`
    ///   - `new`
    public func getStoriesId(by api: HackerNews.API.Stories, completionHandler: @escaping ([Int]) -> Void) {
        ref.child("\(api.rawValue)stories").getData { error, snapshot in
            guard let data = snapshot.data else { return }
            do {
                let user = try JSONDecoder().decode([Int].self, from: data)
                completionHandler(user)
            } catch {
                print(error)
            }
        }
    }
    
    /// Recursively fetches comments and all its childrens
    public func getComments(commentsIds: [Int], completionHandler: @escaping (Bool, [Comment]) -> Void) {
        var returnComments : [Comment] = []
                
        let commentsGroup = DispatchGroup()
        for commentId in commentsIds {
            commentsGroup.enter()
            ref.child("item/\(commentId)").getData { error, snapshot in
                guard let data = snapshot.data else { return }
                do {
                    let comment = try JSONDecoder().decode(Comment.self, from: data)
                    comment.getComments { success in
                        returnComments.append(comment)
                        commentsGroup.leave()
                    }
                } catch {
                    print(error)
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

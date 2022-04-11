//===----------------------------------------------------------------------===//
//
// This source file is part of the Hacker News API Swift open source project
//
// Copyright (c) 2021 Mattia Righetti. All rights reserved.
//
//===----------------------------------------------------------------------===//

import Foundation
import Firebase

// MARK: - Firebase API client

/// HackerNews Client that exposes methods to get users, items and stories from https://news.ycombinator.com
public class HackerNewsFirebaseClient {
    public static let shared = HackerNewsFirebaseClient()
    public var ref: DatabaseReference!
    
    public init() {
        setup()
    }
    
    // MARK: - Firebase Setup
    private func setup() {
        // This will look for the GoogleInfo.plist file in your project and
        // configure the database accordingly
        FirebaseApp.configure()
        // Configure default child `v0` since HN database address
        // is `https://hacker-news.firebaseio.com/v0`
        self.ref = Database.database().reference().child("v0")
    }
    
    /// Generic methods to retrieve child from database using Firebase API
    private func get<T: Decodable>(child: String, _ completionHandler: @escaping (T) -> Void) {
        ref.child(child).getData { error, snapshot in
            guard let data = snapshot.data else { return }
            do {
                let obj = try JSONDecoder().decode(T.self, from: data)
                completionHandler(obj)
            } catch {
                NSLog("error while decoding \(child): \(error)")
            }
        }
    }
    
    /// Retrieves user  from HackerNews
    ///
    /// - parameter username: Username of the user to fetch
    /// - parameter completionHandler: Function that is called immediately after the data is fetched and parsed
    public func getUser(withUsername username: String, completionHandler: @escaping (User) -> Void) {
        get(child: "user/\(username)", completionHandler)
    }
    
    /// Retrieves item from HackerNews
    ///
    /// - parameter id: Id of the item to fetch
    /// - parameter completionHandler: Function that is called immediately after the data is fetched and parsed
    public func getItem(withId id: Int, completionHandler: @escaping (Item) -> Void) {
        get(child: "item/\(id)", completionHandler)
    }
    
    /// Retrieves array of items ids from HackerNews
    ///
    /// - parameter api: Category of the stories to fetch (e.g. `top`, `best`, `new`)
    /// - parameter completionHandler: Function that is called immediately after the data is fetched and parsed
    public func getStoriesIds(_ api: HackerNews.API.Stories, completionHandler: @escaping ([Int]) -> Void) {
        get(child: "\(api.rawValue)stories", completionHandler)
    }
}

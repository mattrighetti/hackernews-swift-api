//===----------------------------------------------------------------------===//
//
// This source file is part of the Hacker News API Swift open source project
//
// Copyright (c) 2021 Mattia Righetti. All rights reserved.
//
//===----------------------------------------------------------------------===//

import Foundation
import Firebase

/// HackerNews Client that exposes methods to get users, items and stories from https://news.ycombinator.com
public class HackerNewsClient {
    public static let shared: HackerNewsClient = HackerNewsClient()
    private let session: URLSession = URLSession.shared
    public let ref: DatabaseReference!
    
    private init() {
        // This will look for the GoogleInfo.plist file in your project and
        // configure the database accordingly
        FirebaseApp.configure()
        // Configure default child `v0` since HN database address
        // is `https://hacker-news.firebaseio.com/v0`
        ref = Database.database().reference().child("v0")
    }
    
    // MARK: - Firebase API methods
    
    /// Generic methods to retrieve child from database using Firebase API
    private func get<T: Decodable>(
        child: String,
        _ completionHandler: @escaping (T) -> Void
    ) {
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
    public func getUser(
        withUsername username: String,
        completionHandler: @escaping (User) -> Void
    ) {
        get(child: "user/\(username)", completionHandler)
    }
    
    /// Retrieves item from HackerNews
    ///
    /// - parameter id: Id of the item to fetch
    /// - parameter completionHandler: Function that is called immediately after the data is fetched and parsed
    public func getItem(
        withId id: Int,
        completionHandler: @escaping (Item) -> Void
    ) {
        get(child: "item/\(id)", completionHandler)
    }
    
    /// Retrieves array of items ids from HackerNews
    ///
    /// - parameter api: Category of the stories to fetch (e.g. `top`, `best`, `new`)
    /// - parameter completionHandler: Function that is called immediately after the data is fetched and parsed
    public func getStoriesIds(
        _ api: HackerNews.API.Stories,
        completionHandler: @escaping ([Int]) -> Void
    ) {
        get(child: "\(api.rawValue)stories", completionHandler)
    }
    
    // MARK: - Web Scraping methods
    
    /// Retrieves comments of a specified item
    ///
    /// This method will scrape comments directly from `https://news.ycombinator.com`.
    /// Comments are fetched way faster than the recursive method, this method will return a success value
    /// that tells if the scraping operations has been successfully run,  scraped comments and a bool value indicating if there are more to fetch.
    ///
    /// Comments are returned exactly in the same order as the ones presented on the website
    ///
    /// - parameter id: ItemID to whose comments will be scraped
    /// - parameter page: Page number from where comments will be scraped
    /// - parameter completionHander: Completion handler that will run after comments are fetched
    /// - parameter comments: Scraped comments, this will be empty if there are no comments/something goes wrong during the fetching process
    /// - parameter hasMore: This will be true if there are more comments available in next pages
    public func getComments(
        forItemId id: Int,
        page: Int? = 0,
        completionHandler: @escaping (_ success: Bool, _ comments: [Comment], _ hasMore: Bool) -> Void
    ) {
        let result = scrapeComments(for: .item(id, page!))
        completionHandler(result.0, result.1, result.2)
    }
}

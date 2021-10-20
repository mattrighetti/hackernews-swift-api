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
}

// MARK: - Web Scraping client

public class HackerNewsScraperClient {
    public static var shared = HackerNewsScraperClient()
    
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
    
    /// Logs in user with the specified credentials
    public func login(username: String, password: String, completionHandler: @escaping (Data) -> Void) {
        let config = URLSessionConfiguration.ephemeral
        config.httpCookieAcceptPolicy = .never
        let session = URLSession(configuration: config)
        
        let parameters = "acct=\(username)&pw=\(password)"
        let postData =  parameters.data(using: .utf8)
        let req = URLRequest(method: "POST", urlString: "https://news.ycombinator.com/login", withData: postData!)
        let task = session.dataTask(with: req) { data, response, error in
            print(response)
            print(HTTPCookieStorage.shared.cookies)
        }
        task.resume()
    }
    
    /// Logs user out
    public func logout(username: String, completionHandler: @escaping (String) -> Void) {
        let code = scrapeLogout(for: HackerNews.API.User.id(username))
        completionHandler(code ?? "")
    }
}

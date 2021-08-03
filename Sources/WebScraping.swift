//===----------------------------------------------------------------------===//
//
// This source file is part of the Hacker News API Swift open source project
//
// Copyright (c) 2021 Mattia Righetti. All rights reserved.
//
//===----------------------------------------------------------------------===//

import Foundation
import SwiftSoup

/// Scrapes comments directly from https://news.ycombinator.com
/// - Parameter web: website url to scrape
/// - Returns 
func scrapeComments(
    for web: HackerNews.WebsiteURL
) -> (
    success: Bool,
    comments: [Comment],
    hasMore: Bool
) {
    // Get page HTML
    let source = try! String(contentsOf: web.url)
    // Parse HTML with SwiftSoup
    let document = try! SwiftSoup.parse(source)
    do {
        // Retrieve comments table that is always marked with class `athing comtr`
        let table = try document.getElementsByClass("athing comtr")
        // Check if there are more comments available to fetch
        let hasMore = try document.getElementsByClass("morelink").first() != nil ? true : false
        // Return an array of ScrapedComments and a bool value indicating if there are more comments to fetch
        return (true, parseCommentsTable(table), hasMore)
    } catch {
        NSLog("Cannot find table element in document")
        return (false, [], false)
    }
}

// Given a table of comments, dissects into array of `ScrapedComments`
func parseCommentsTable(_ elems: Elements) -> [Comment] {
    var comments = [Comment]()
    for e in elems {
        guard let comment = parseComment(e) else { continue }
        comments.append(comment)
    }
    return comments
}

func parseComment(_ elem: Element) -> Comment? {
    // Get comment id
    let id = Int(elem.id())!
    // Get index level of comment
    let index = parseIndexLevel(try! elem.getElementsByClass("ind").first()!)
    // Get comment's user
    let user = try! elem.getElementsByClass("hnuser").text()
    // Get comment text
    let comment = try! elem.getElementsByClass("comment").first()!
    // Get comment post time
    let time = try! elem.getElementsByClass("age").first()!.children().first()!.text()
    let commentHTML = parseCommentText(comment)
    return Comment(id: id, text: commentHTML, by: user, time: time, indentLevel: index)
}

func parseCommentText(_ comment: Element) -> String? {
    do {
        let commElem = try comment.getElementsByClass("commtext")
        guard let comm = commElem.first() else { return nil }
        let childs = comm.children()
        var text = try comm.text()
        for child in childs {
            if !child.hasClass("reply") {
                text.append(try child.outerHtml())
            }
        }
        return text
    } catch {
        // comments that appear as [deleted] do not have `<span class="commtext" />` element
        return nil
    }
}

func parseIndexLevel(_ index: Element) -> Int {
    // On https://news.ycombinator.com each comment is indexed with a width of 40
    // This is needed to translate the index level to values from 0..3
    if let value = Int(index.children().first()!.getAttributes()!.get(key: "width")) {
        return value / 40
    }
    return 0
}

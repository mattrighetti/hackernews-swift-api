//
//  File.swift
//  
//
//  Created by Mattia Righetti on 31/07/21.
//

import Foundation
import SwiftSoup

func scrapeComments(for web: HackerNews.WebsiteURL) -> ([ScrapedComment], Bool) {
    let source = try! String(contentsOf: web.url)
    let document = try! SwiftSoup.parse(source)
    let table = try! document.getElementsByClass("athing comtr")
    let hasMore = try! document.getElementsByClass("morelink").first() != nil ? true : false
    return (parseCommentsTable(table), hasMore)
}

func parseCommentsTable(_ elems: Elements) -> [ScrapedComment] {
    var comments = [ScrapedComment]()
    var comment: ScrapedComment?
    for e in elems {
        comment = parseComment(e)
        guard comment != nil else { continue }
        comments.append(comment!)
    }
    return comments
}

// tr element parser
func parseComment(_ elem: Element) -> ScrapedComment? {
    let id = Int(elem.id())!
    let index = parseIndex(try! elem.getElementsByClass("ind").first()!)
    let user = try! elem.getElementsByClass("hnuser").text()
    let comment = try! elem.getElementsByClass("comment").first()!
    let time = try! elem.getElementsByClass("age").first()!.children().first()!.text()
    let commentHTML = parseCommentText(comment)
    return ScrapedComment(id: id, text: commentHTML, by: user, time: time, indentLevel: index)
}

func parseCommentText(_ comment: Element) -> String? {
    var text: String?
    if comment.children().first()!.hasClass("c00") {
        // <span> does not encapsulate reply
        text = try! comment.getElementsByClass("commtext").first()!.html()
    } else if comment.children().first()!.hasClass("c5a") {
        // <span> does encapsulate reply
        let comm = try! comment.getElementsByClass("commtext").first()!
        let childs = comm.children()
        text = try! comm.text()
        for child in childs {
            if !child.hasClass("reply") {
                text?.append(try! child.outerHtml())
            }
        }
    }
    return text
}

func parseIndex(_ index: Element) -> Int {
    if let value = Int(index.children().first()!.getAttributes()!.get(key: "width")) {
        return value / 40
    }
    return 0
}

//
//  File.swift
//  
//
//  Created by Mattia Righetti on 22/07/21.
//

import Foundation

public class Comment: Codable {
    var id:    Int?
    var by:    String?
    var text:  String?
    var time:  Int?
    var commentsIds : Array<Int> = []
    var comments : [Comment] = []
    var indentLevel : Int = 0
    
    func getComments(completionHandler: @escaping (Bool) -> Void) {
        guard commentsIds.count > 0 else {
            completionHandler(true)
            return
        }
        
        var returnComments : [Comment] = []
        
        let commentsGroup = DispatchGroup()
        for commentId in commentsIds {
            commentsGroup.enter()
            let currentIndentLevel = self.indentLevel
            URLSession.request(urlString: HackerNews.API.Item.id(commentId).urlString, type: Comment.self) { comment in
                comment.indentLevel = currentIndentLevel + 1
                comment.getComments { success in
                    returnComments.append(comment)
                    commentsGroup.leave()
                }
            }
        }
        
        commentsGroup.notify(queue: .main) {
            self.comments = returnComments
            completionHandler(true)
        }
    }
    
    func numberOfComments() -> Int {
        var numberOfComments = comments.count
        for comment in comments {
            numberOfComments += comment.numberOfComments()
        }
        return numberOfComments
    }
    
    func flattenedComments() -> Any {
        var commentsArray: [Any] = [self]
        for comment in comments {
            commentsArray += comment.flattenedComments() as! Array<Any>
        }
        return commentsArray
    }
}

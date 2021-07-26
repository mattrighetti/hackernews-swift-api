//
//  File.swift
//  
//
//  Created by Mattia Righetti on 22/07/21.
//

import Foundation

public class Comment: Decodable {
    public var id: Int?
    public var by: String?
    public var text: String?
    public var time: Int?
    public var kids: [Int]?
    public var comments: [Comment]? = []
    public var indentLevel: Int? = 0
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try? container.decode(Int.self, forKey: .id)
        by = try? container.decode(String.self, forKey: .by)
        text = try? container.decode(String.self, forKey: .text)
        kids = try? container.decode([Int].self, forKey: .kids)
        comments = [Comment]()
        indentLevel = 0
    }
    
    private enum CodingKeys: CodingKey {
        case id, by, text, time, kids
    }
    
    public func getComments(completionHandler: @escaping (Bool) -> Void) {
        guard kids != nil, kids!.count > 0 else {
            completionHandler(true)
            return
        }
        
        var returnComments : [Comment] = []
        
        let commentsGroup = DispatchGroup()
        for commentId in kids! {
            commentsGroup.enter()
            let currentIndentLevel = self.indentLevel
            // TODO control this section maybe without a client
            HackerNewsClient.shared.ref.child("item/\(commentId)").getData { error, snapshot in
                guard let data = snapshot.data else { return }
                do {
                    let comment = try JSONDecoder().decode(Comment.self, from: data)
                    comment.indentLevel = currentIndentLevel! + 1
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
            self.comments = returnComments
            completionHandler(true)
        }
    }
    
    public func numberOfComments() -> Int {
        var numberOfComments = comments!.count
        for comment in comments! {
            numberOfComments += comment.numberOfComments()
        }
        return numberOfComments
    }
    
    public func flattenedComments() -> Any {
        var commentsArray: [Any] = [self]
        for comment in comments! {
            commentsArray += comment.flattenedComments() as! Array<Any>
        }
        return commentsArray
    }
}

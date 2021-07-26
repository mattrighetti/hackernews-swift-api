//
//  File.swift
//  
//
//  Created by Mattia Righetti on 26/07/21.
//

import Foundation

extension Array {
    public func slice(from index: Int, next: Int) -> (Array<Element>, Bool) {
        let upper = index + next
        if upper-1 < self.count-1 {
            return (Array(self[index...upper-1]), false)
        }
        return (Array(self[index...self.count-1]), true)
    }
}

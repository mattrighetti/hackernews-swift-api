//
//  File.swift
//  
//
//  Created by Mattia Righetti on 23/07/21.
//

import Firebase

extension DataSnapshot {
    var data: Data? {
        guard let value = self.value else { return nil }
        return try? JSONSerialization.data(withJSONObject: value)
    }
    
    var json: String? { data?.string }
}

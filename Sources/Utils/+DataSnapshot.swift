//===----------------------------------------------------------------------===//
//
// This source file is part of the Hacker News API Swift open source project
//
// Copyright (c) 2021 Mattia Righetti. All rights reserved.
//
//===----------------------------------------------------------------------===//

import Firebase

extension DataSnapshot {
    var data: Data? {
        guard let value = self.value else { return nil }
        // TODO this could leave some comments behind
        if !JSONSerialization.isValidJSONObject(value) { return nil }
        return try? JSONSerialization.data(withJSONObject: value)
    }
    
    var json: String? { data?.string }
}

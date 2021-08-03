//===----------------------------------------------------------------------===//
//
// This source file is part of the Hacker News API Swift open source project
//
// Copyright (c) 2021 Mattia Righetti. All rights reserved.
//
//===----------------------------------------------------------------------===//

import Foundation

extension Data {
    var string: String? {
        String(data: self, encoding: .utf8)
    }
}

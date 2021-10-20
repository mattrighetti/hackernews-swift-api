//
//  File.swift
//  
//
//  Created by Mattia Righetti on 06/08/21.
//

import XCTest
@testable import HackerNews

final class ClientTests: XCTestCase {
    func testLogin() throws {
        // Set expectation. Used to test async code.
        let expectation = XCTestExpectation(description: "response")
        HackerNewsFirebaseClient.shared.login(username: "testuser", password: "testpasswd", completionHandler: { data in
            print("Done")
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10)
    }
}

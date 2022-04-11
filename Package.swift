// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HackerNews",
    platforms: [
        .macOS(.v11),
        .iOS(.v11)
    ],
    products: [
        .library(name: "HackerNews", targets: ["HackerNews"]),
    ],
    dependencies: [
        .package(name: "Firebase", url: "https://github.com/firebase/firebase-ios-sdk.git", from: "8.4.0")
    ],
    targets: [
        .target(
            name: "HackerNews",
            dependencies: [
                .product(name: "FirebaseDatabase", package: "Firebase")
            ], path: "Sources"),
        .testTarget(
            name: "HackerNewsTests",
            dependencies: ["HackerNews"], path: "Tests"),
    ]
)

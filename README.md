# HackerNews Swift API

This is a swift package that contains the most useful methods that can be used to download stories, comments, user from Hacker News

## Installation

### Swift Package Manage
HackerNew API is also available through [Swift Package Manager](https://github.com/apple/swift-package-manager). To install it, simply add the dependency to your Package.Swift file:

```swift
...
dependencies: [
    .package(url: "https://github.com/mattrighetti/hackernews-swift-api", from: "1.0.0"),
],
targets: [
    .target( name: "YourTarget", dependencies: ["HackerNews"]),
]
...
```

## Dependencies

|Library|Usage description|
|:-:|:-:|
|[Firebase API for iOS](https://github.com/firebase/firebase-ios-sdk)|This package is used to fetch items from the Firebase Database|
|[SwiftSoup](https://github.com/scinfu/SwiftSoup)|SwiftSoup is used to scrape comments directly from the HN page which is considerably faster than recursively fetching comments from Firebase|

## Usage
### Get **top,** **best** and **new** stories
```swift
HackerNewsClient.shared.getStoriesIds(.top) { topIds in
    assert(!topIds.isEmpty())
    print("fetched top items ids: \(topIds)")
}
```

### Get an item
```swift
HackerNewsClient.shared.getItem(withId: 27676266) { item in
    print("fetched item: \(item)")
}
```

### Get item comments
```swift
let c: [Comment]!
HackerNewsClient.shared.getComments(forItemId: 27676266) { success, comments, hasMore in
    guard success == true else { return }
    assert(!comments.isEmpty())
    c = comments
    if hasMore {
        print("there are more comments ready to fetch in next pages")
    }
}

HackerNewsClient.shared.getComments(forItemId: 27676266, page: 2) { success, comments, hasMore in
    guard success == true else { return }
    c.append(comments)
}

print("fetched comments: \(comments)")
```

### Get a user
```swift
HackerNewsClient.shared.getUser(withUsername: "mattrighetti") { user in
    print("fetched user: \(user)")
}
```


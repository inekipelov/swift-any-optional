# swift-any-optional

`AnyOptional` is a tiny Swift Package that type-erases optional checks behind a
single protocol.

It is useful when you need to inspect values generically and determine whether a
value is `nil` without knowing the concrete `Wrapped` type at compile time.

## Installation

Add the package to your `Package.swift` dependencies:

```swift
.package(url: "https://github.com/inekipelov/swift-any-optional.git", from: "1.0.0")
```

Then add `AnyOptional` to your target dependencies:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        "AnyOptional"
    ]
)
```

## Usage

```swift
import AnyOptional

let title: String? = "Track Finder"
let subtitle: String? = nil

print(title.isNil)    // false
print(title.isSome)   // true
print(subtitle.isNil) // true
print(subtitle.isSome) // false

let values: [AnyOptional] = [title, subtitle]
let missingCount = values.filter(\.isNil).count
print(missingCount) // 1
```

## API

```swift
public protocol AnyOptional {
    var isNil: Bool { get }
    var isSome: Bool { get }
}
```

`Optional` conforms to `AnyOptional` automatically, so every Swift optional gets
`isNil` and `isSome` without extra wrappers.

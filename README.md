# AnyOptional

`AnyOptional` is a tiny Swift Package that type-erases optional checks behind a
single protocol.

It is useful when you need to inspect values generically and determine whether a
value is `nil` without knowing the concrete `Wrapped` type at compile time.

<p align="center">
  <a href="https://swift.org"><img src="https://img.shields.io/badge/Swift-6.0+-F05138?logo=swift&logoColor=white" alt="Swift 6.0+"></a>
  <a href="https://developer.apple.com"><img src="https://img.shields.io/badge/iOS-13.0+-000000?logo=apple" alt="iOS 13.0+"></a>
  <a href="https://developer.apple.com"><img src="https://img.shields.io/badge/macOS-10.15+-000000?logo=apple" alt="macOS 10.15+"></a>
  <a href="https://developer.apple.com"><img src="https://img.shields.io/badge/tvOS-13.0+-000000?logo=apple" alt="tvOS 13.0+"></a>
  <a href="https://developer.apple.com"><img src="https://img.shields.io/badge/watchOS-6.0+-000000?logo=apple" alt="watchOS 6.0+"></a>
  <a href="https://developer.apple.com/visionos/"><img src="https://img.shields.io/badge/visionOS-1.0+-000000?logo=apple" alt="visionOS 1.0+"></a>
</p>

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

let title: String? = "Hello, world!"
let subtitle: String? = "Lorem ipsum"
let caption: String? = nil

print(title.isNil)    // false
print(title.isSome)   // true
print(subtitle.isNil) // false
print(subtitle.isSome) // true
print(caption.isNil)  // true
print(caption.isSome) // false

let values: [AnyOptional] = [title, subtitle, caption]
let missingCount = values.filter(\.isNil).count
print(missingCount) // 1
```

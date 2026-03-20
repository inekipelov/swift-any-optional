// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "swift-any-optional",
    products: [
        .library(
            name: "AnyOptional",
            targets: ["AnyOptional"]
        )
    ],
    targets: [
        .target(
            name: "AnyOptional"
        ),
        .testTarget(
            name: "AnyOptionalTests",
            dependencies: ["AnyOptional"]
        )
    ]
)

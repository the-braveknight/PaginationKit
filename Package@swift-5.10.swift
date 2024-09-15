// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "pagination-kit",
    platforms: [
       .macOS(.v13)
    ],
    products: [
        .library(name: "PaginationKit", targets: ["PaginationKit"]),
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.99.3"),
        // 🗄 An ORM for SQL and NoSQL databases.
        .package(url: "https://github.com/vapor/fluent.git", from: "4.9.0"),
    ],
    targets: [
        .target(name: "PaginationKit", dependencies: [
            .product(name: "Vapor", package: "vapor"),
            .product(name: "Fluent", package: "fluent")
        ], swiftSettings: swiftSettings),
    ]
)

var swiftSettings: [SwiftSetting] { [
    .enableExperimentalFeature("StrictConcurrency=complete"),
] }

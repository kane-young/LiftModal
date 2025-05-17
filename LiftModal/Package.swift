// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LiftModal",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "LiftModal",
            targets: ["LiftModal"]),
    ],
    targets: [
        .target(
            name: "LiftModal", path: "Sources/LiftModal"),
        .testTarget(
            name: "LiftModalTests",
            dependencies: ["LiftModal"]),
    ]
)

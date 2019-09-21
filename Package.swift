// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FLineTestClient",
    dependencies: [
        .package(path: "../FLineCore"),
        .package(url: "https://github.com/ReSwift/ReSwift.git", from: "5.0.0"), 
    ],
    targets: [
        .target(
            name: "FLineTestClient",
            dependencies: [
            "FLineCore",
            "ReSwift"]),
        .testTarget(
            name: "FLineTestClientTests",
            dependencies: ["FLineTestClient"]),
    ]
)

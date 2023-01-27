// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "GAppAuth",
    platforms: [
        .macOS(.v10_13),
        .iOS(.v11)
    ],
    products: [
        .library(name: "GAppAuth-iOS", targets: ["GAppAuth-iOS"]),
        .library(name: "GAppAuth-macOS", targets: ["GAppAuth-macOS"])
    ],
    dependencies: [
        .package(url: "https://github.com/google/GTMAppAuth.git", from: "2.0.0"),
        .package(url: "https://github.com/openid/AppAuth-iOS.git", from: "1.6.0")
    ],
    targets: [
        .target(name: "GAppAuth-iOS",
                dependencies: [
                    .product(name: "AppAuth", package: "AppAuth-iOS"),
                    .product(name: "GTMAppAuth", package: "GTMAppAuth"),
                ], path: "Sources/iOS"),
        .target(name: "GAppAuth-macOS",
                dependencies: [
                    .product(name: "AppAuth", package: "AppAuth-iOS"),
                    .product(name: "GTMAppAuth", package: "GTMAppAuth"),
                ], path: "Sources/macOS")
    ]
)

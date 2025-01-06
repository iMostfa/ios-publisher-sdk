// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-criteo-publisher-sdk",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CriteoPublisherSdk",
            type: .static,
            targets: ["CriteoPublisherSdk"]
        ),
        .library(
            name: "GoogleAdapter",
            targets: ["GoogleAdapter", "CriteoPublisherSdk"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", from: "11.1.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CriteoPublisherSdk",
            dependencies: [
                "SKAdNetworkInfo",
                "MRAID"
            ],
            path: "CriteoPublisherSdk/Sources/CriteoPublisherSdk",
            resources: [
                .process("PrivacyInfo.xcprivacy")
            ],
            publicHeadersPath: "Public",
            linkerSettings: [
                .linkedFramework("WebKit"),
            ]
        ),
        .target(
            name: "SKAdNetworkInfo",
            path: "CriteoPublisherSdk/Sources/SKAdNetworkInfo"
        ),
        .target(
            name: "MRAID",
            path: "CriteoPublisherSdk/Sources/MRAID"
        ),
        .target(
            name: "GoogleAdapter",
            dependencies: [
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
            ],
            path: "CriteoGoogleAdapter/Sources",
            publicHeadersPath: "."
        ),
    ]
)

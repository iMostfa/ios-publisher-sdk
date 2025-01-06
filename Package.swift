// swift-tools-version: 5.9
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
            type: .static,
            targets: ["GoogleAdapter"]
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
            dependencies: ["MRAID", "CriteoCore", "SKAdNetworkInfo"],
            path: "CriteoPublisherSdk/Sources/CriteoPublisherSdk",
            resources: [
                .process("PrivacyInfo.xcprivacy")
            ],
            publicHeadersPath: "Public",
            cSettings: [
                .headerSearchPath("AppEvents"),
                .headerSearchPath("Cassette"),
                .headerSearchPath("Configuration"),
                .headerSearchPath("Context"),
                .headerSearchPath("Criteo"),
                .headerSearchPath("DataConsent"),
                .headerSearchPath("Display"),
                .headerSearchPath("Feedback"),
                .headerSearchPath("Logging"),
                .headerSearchPath("Native"),
                .headerSearchPath("Network"),
                .headerSearchPath("Public"),
                .headerSearchPath("SKAdNetwork"),
                .headerSearchPath("Standalone"),
                .headerSearchPath("Threading"),
                .headerSearchPath("Util")
            ],
            linkerSettings: [
                .linkedFramework("WebKit"),
            ]
        ),
        .target(
            name: "SKAdNetworkInfo",
            dependencies: ["CriteoCore"],
            path: "CriteoPublisherSdk/Sources/SKAdNetworkInfo"
//            linkerSettings: [
//                .unsafeFlags(["-ObjC"]),
//            ]
        ),
        .target(
            name: "MRAID",
            path: "CriteoPublisherSdk/Sources/MRAID"
        ),
        .target(
            name: "GoogleAdapter",
            dependencies: [
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                "CriteoPublisherSdk"
            ],
            path: "CriteoGoogleAdapter/Sources/CriteoGoogleAdapter",
            publicHeadersPath: "."
        ),
        .target(
            name: "CriteoCore",
            path: "CriteoPublisherSdk/Sources/CriteoCore",
            publicHeadersPath: "."
        ),
    ],
    swiftLanguageVersions: [.v5]
)

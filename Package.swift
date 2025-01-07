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

        // MARK: - Criteo

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
        .testTarget(
            name: "CriteoPublisherSdkTests",
            dependencies: ["CriteoPublisherSdk", "Mocks"],
            path: "CriteoPublisherSdk/Tests/Criteo"
        ),
        .testTarget(
            name: "CriteoPublisherSdkSwiftTests",
            dependencies: ["CriteoPublisherSdk", "Mocks"],
            path: "CriteoPublisherSdk/Tests/CriteoSwift"
        ),
        .testTarget(
            name: "FeedbackTests",
            dependencies: ["CriteoPublisherSdk", "Mocks"],
            path: "CriteoPublisherSdk/Tests/Feedback"
        ),
        .testTarget(
            name: "LoggingTests",
            dependencies: ["CriteoPublisherSdk", "Mocks"],
            path: "CriteoPublisherSdk/Tests/Logging"
        ),
        .testTarget(
            name: "NetworkTests",
            dependencies: ["CriteoPublisherSdk", "Mocks"],
            path: "CriteoPublisherSdk/Tests/Network"
        ),


        // MARK: - SKAdNetworkInfo
        .target(
            name: "SKAdNetworkInfo",
            dependencies: ["CriteoCore"],
            path: "CriteoPublisherSdk/Sources/SKAdNetworkInfo"
        ),
        .testTarget(
            name: "SkAdNetworkInfoTests",
            dependencies: ["SKAdNetworkInfo", "Mocks"],
            path: "CriteoPublisherSdk/Tests/SKAdNetworkInfo"
        ),

        // MARK: - MRAID

        .target(
            name: "MRAID",
            path: "CriteoPublisherSdk/Sources/MRAID"
        ),
        .testTarget(
            name: "MRAIDTests",
            dependencies: ["MRAID", "Mocks"],
            path: "CriteoPublisherSdk/Tests/MRAID"
        ),

        // MARK: - GoogleAdapter

        .target(
            name: "GoogleAdapter",
            dependencies: [
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                "CriteoPublisherSdk"
            ],
            path: "CriteoGoogleAdapter/Sources/CriteoGoogleAdapter",
            publicHeadersPath: "."
        ),
        .testTarget(
            name: "GoogleAdapterTests",
            dependencies: ["GoogleAdapter"],
            path: "CriteoGoogleAdapter/Tests/CriteoGoogleAdapterTests"
        ),

        // MARK: - Dependency Management and Entanglement

        .target(
            name: "CriteoCore",
            path: "CriteoPublisherSdk/Sources/CriteoCore",
            publicHeadersPath: "."
        ),
        .target(
            name: "Mocks",
            dependencies: ["CriteoPublisherSdk"],
            path: "CriteoPublisherSdk/Tests/Mocks"
        ),
    ],
    swiftLanguageVersions: [.v5]
)

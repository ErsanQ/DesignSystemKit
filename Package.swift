// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "DesignSystemKit",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .tvOS(.v14),
        .watchOS(.v7),
        .visionOS(.v1)
    ],
    products: [
        .library(
            name: "DesignSystemKit",
            targets: ["DesignSystemKit"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DesignSystemKit",
            dependencies: [],
            path: "Sources/DesignSystemKit"),
        .testTarget(
            name: "DesignSystemKitTests",
            dependencies: ["DesignSystemKit"],
            path: "Tests/DesignSystemKitTests"),
    ]
)

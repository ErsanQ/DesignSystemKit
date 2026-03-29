// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "DesignSystemKit",
    platforms: [
        .iOS(.v14),
        .macOS(.v11)
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

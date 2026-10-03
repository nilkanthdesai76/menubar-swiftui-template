// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MenuBarAppTemplate",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(
            name: "MenuBarApp",
            targets: ["MenuBarApp"]
        )
    ],
    targets: [
        .executableTarget(
            name: "MenuBarApp",
            dependencies: []
        ),
        .testTarget(
            name: "MenuBarAppTests",
            dependencies: ["MenuBarApp"]
        )
    ]
)

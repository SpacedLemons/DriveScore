// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Networking",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Networking",
            targets: ["Networking"]
        ),
        .library(
            name: "NetworkingMocks",
            targets: ["NetworkingMocks"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Networking",
            path: "Sources",
            sources: ["Model", "Networking"]
        ),
        .target(
            name: "NetworkingMocks",
            dependencies: ["Networking"],
            path: "Mocks",
            sources: ["."]
        ),
        .testTarget(
            name: "NetworkingTests",
            dependencies: ["Networking", "NetworkingMocks"],
            path: "Tests",
            sources: ["NetworkingTests"]
        ),
    ]
)

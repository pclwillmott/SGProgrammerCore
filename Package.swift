// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SGProgrammerCore",
    defaultLocalization: "en-GB",
    platforms: [.macOS(.v12)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SGProgrammerCore",
            targets: ["SGProgrammerCore"]),
    ],
    dependencies: [
      .package(url: "https://github.com/pclwillmott/SGUnitConversion", .upToNextMajor(from: "0.0.5")),
      .package(url: "https://github.com/pclwillmott/SGInteger", .upToNextMajor(from: "0.0.4")),    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SGProgrammerCore",
            dependencies: [
              .product(name: "SGInteger", package: "SGInteger"),
              .product(name: "SGUnitConversion", package: "SGUnitConversion"),
          ]),
        .testTarget(
            name: "SGProgrammerCoreTests",
            dependencies: ["SGProgrammerCore"]
        ),
    ]
)

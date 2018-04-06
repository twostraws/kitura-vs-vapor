// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Architectures",
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/Kitura.git", from: "2.2.0"),
        .package(url: "https://github.com/IBM-Swift/Swift-Kuery-SQLite.git", from: "1.0.0"),
        .package(url: "https://github.com/IBM-Swift/Swift-Kuery-ORM.git", from: "0.0.3"),
        .package(url: "https://github.com/IBM-Swift/Kitura-StencilTemplateEngine.git", from: "1.8.3")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Architectures",
            dependencies: ["Kitura" , "SwiftKuerySQLite", "SwiftKueryORM", "KituraStencil"]),
    ]
)

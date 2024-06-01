// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "Bibbi-Package",
    platforms: [
        .iOS(.v15),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "Macros",
            targets: ["MacrosInterface"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.0"),
        .package(url: "https://github.com/ReactorKit/ReactorKit.git", from: "3.2.0"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.3.0")
    ],
    targets: [
        .macro(
            name: "MacrosImplementation",
            dependencies: [
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
                .product(name: "SwiftDiagnostics", package: "swift-syntax"),
            ],
            path: "Sources/Macros/Implementation"
        ),

        .target(
            name: "MacrosInterface",
            dependencies: [
                "MacrosImplementation",
                .product(name: "ReactorKit", package: "ReactorKit"),
                .product(name: "Dependencies", package: "swift-dependencies")
            ],
            path: "Sources/Macros/Interface"
        ),

        .executableTarget(
            name: "MacrosPlayground",
            dependencies: [
                "MacrosInterface"
            ],
            path: "Sources/Macros/Playground"
        ),

        .testTarget(
            name: "Bibbi-MacroTests",
            dependencies: [
                "MacrosImplementation",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ],
            path: "Tests/Macros"
        ),
    ]
)

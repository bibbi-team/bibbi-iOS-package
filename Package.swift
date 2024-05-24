// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "Bibbi-Package",
    platforms: [
        .macOS(.v10_15),
            .iOS(.v13)
    ],
    products: [
        .library(
            name: "Macros",
            targets: ["MacrosInterface"]
        ),
        
        .executable(
            name: "MacrosPlayground",
            targets: ["MacrosPlayground"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.0"),
    ],
    targets: [
        .macro(
            name: "MacrosImplementation",
            dependencies: [
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
                .product(name: "SwiftDiagnostics", package: "swift-syntax")
            ],
            path: "Sources/Macros/Implementation"
        ),

        .target(
            name: "MacrosInterface",
            dependencies: [
                "MacrosImplementation"
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
                "MacrosInterface",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ],
            path: "Tests/Macros"
        ),
    ]
)

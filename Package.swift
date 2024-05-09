// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "Bibbi-Macro",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
    products: [
        .library(
            name: "Bibbi-Macro",
            targets: ["Bibbi-Macro"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.0"),
    ],
    targets: [
        .macro(
            name: "Bibbi-Macros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),

        .target(name: "Bibbi-Macro", dependencies: ["Bibbi-Macros"]),

        .executableTarget(name: "Bibbi-Client", dependencies: ["Bibbi-Macro"]),

        .testTarget(
            name: "Bibbi-MacroTests",
            dependencies: [
                "Bibbi-Macros",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ]
        ),
    ]
)

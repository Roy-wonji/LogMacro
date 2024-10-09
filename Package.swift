// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "LogMacro",
    platforms: [.iOS(.v13), .macOS(.v10_15)],
    products: [
        .library(
            name: "LogMacro",
            targets: ["LogMacro"]
        ),
//        .executable(
//            name: "LogMacroClient",
//            targets: ["LogMacroClient"]
//        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-syntax.git", from: "600.0.1"),
    ],
    targets: [
        .macro(
            name: "LogMacroMacro",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),
        .target(
            name: "LogMacro",
            dependencies: [
               "LogMacroMacro"
            ],
            linkerSettings: [
                .linkedFramework("OSLog")
            ]
        ),
        .executableTarget(name: "LogMacroClient", dependencies: ["LogMacro"]),
        .testTarget(
            name: "LogMacroTests",
            dependencies: [
                "LogMacroMacro",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ]
        ),
    ],
    swiftLanguageModes: [.version("5.10.0"), .version("6.0")]
)

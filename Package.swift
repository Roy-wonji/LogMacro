// swift-tools-version:6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "LogMacro",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v12)
    ],
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
          url: "https://github.com/apple/swift-syntax.git",  "509.0.2"..<"602.0.0"),
        .package(url: "https://github.com/apple/swift-docc-plugin.git", exact: "1.4.4"),
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
    swiftLanguageModes: [.version("6.1.0")]
)

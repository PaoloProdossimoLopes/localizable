// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Localizable",
    defaultLocalization: "en",
    products: [
        .library(name: "Localizable", targets: ["Localizable"]),
    ],
    targets: [
        .target(name: "Localizable"),
        .testTarget(name: "LocalizableTests", dependencies: ["Localizable"]),
    ]
)

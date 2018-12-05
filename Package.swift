// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "TaxCalculator",
    products: [
        .library(name: "TaxCalculator", targets: ["TaxCalculator"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio.git", from: "1.11.0")
    ],
    targets: [
        .target(name: "TaxCalculator", dependencies: ["NIO"]),
        .testTarget(name: "TaxCalculatorTests", dependencies: ["TaxCalculator"]),
    ]
)
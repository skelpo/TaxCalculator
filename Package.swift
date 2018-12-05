// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "TaxCalculator",
    products: [
        .library(name: "TaxCalculator", targets: ["TaxCalculator"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "TaxCalculator", dependencies: []),
        .testTarget(name: "TaxCalculatorTests", dependencies: ["TaxCalculator"]),
    ]
)
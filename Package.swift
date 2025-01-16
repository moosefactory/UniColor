// swift-tools-version: 5.9
//   /\/\__/\/\      MFFoundation
//   \/\/..\/\/      Swift Framework - v2.0
//      (oo)
//  MooseFactory
//    Software
//  ------------------------------------------

import PackageDescription

let package = Package(
    name: "UniColor",
    platforms: [
        .macOS(.v11),
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "UniColor",
            targets: ["UniColor"]),
    ],
    dependencies: [
        .package(path: "../MFFoundation"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "UniColor",
            dependencies: ["MFFoundation"]),
        .testTarget(
            name: "UniColorTests",
            dependencies: ["UniColor"]),
    ]
)

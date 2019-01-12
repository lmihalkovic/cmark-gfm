// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "cmark",
    products: [
        .library(name: "cmark", targets: ["cmark-gfm"]),
    ],
    targets: [
        .target(name: "cmark-gfm", 
              path: ".",
              exclude: ["src/main.c"],
              sources: ["src", "extensions"]),
        .testTarget(name: "cmark-tests", 
              dependencies: ["cmark-gfm"],
              path: "./Tests/SwiftTest"),
    ],
    swiftLanguageVersions: [4]
)

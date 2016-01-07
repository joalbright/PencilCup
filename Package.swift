//
//  Package.swift
//  PencilCup
//
//  Created by Jo Albright on 1/7/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "PencilCup",
    dependencies: [
        .Package(url: "https://github.com/joalbright/Inlinit.git", majorVersion: 0)
    ]
)
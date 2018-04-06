//
//  Architecture.swift
//  Architectures
//
//  Created by Paul Hudson on 06/04/2018.
//

import Foundation
import Kitura

struct Architecture: Codable {
    var components: [String]
    var name: String
    var initialism: String
}


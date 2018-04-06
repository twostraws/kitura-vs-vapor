//
//  Architecture.swift
//  App
//
//  Created by Paul Hudson on 06/04/2018.
//

import Foundation
import Vapor

struct Architecture: Content {
    var components: [String]
    var name: String
    var initialism: String
}

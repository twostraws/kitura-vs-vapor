//
//  Component.swift
//  Architectures
//
//  Created by Paul Hudson on 06/04/2018.
//

import Foundation
import Kitura
import SwiftKueryORM

struct Component: Model {
    var id: Int?
    var name: String

    static let words = [
        "Model",
        "View",
        "Controller",
        "Interactor",
        "Presenter",
        "Store",
        "Helper",
        "Singleton",
        "View-model",
        "Functional",
        "Entity",
        "Router",
        "Builder"
    ]
}



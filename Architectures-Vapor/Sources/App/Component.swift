//
//  Component.swift
//  App
//
//  Created by Paul Hudson on 06/04/2018.
//

import FluentSQLite
import Foundation
import Vapor

struct Component: Content, SQLiteModel, Migration {
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



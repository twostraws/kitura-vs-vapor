//
//  App.swift
//  Architectures
//
//  Created by Paul Hudson on 06/04/2018.
//

import Foundation
import Kitura

// simplest possible array shuffle
extension Array {
    func shuffled() -> [Element] {
        return self.sorted { _, _ in arc4random() < arc4random() }
    }
}

class App {
    lazy var router: Router = {
        let router = Router()

        router.get("setup") {
            request, response, next in
            defer { next() }

            Component.findAll { existing, error in
                guard let existing = existing else {
                    fatalError("Error attempting to read the database: \(error?.localizedDescription ?? "Unknown error")")
                }

                guard existing.count == 0 else {
                    response.send("Existing components already made")
                    return
                }

                for word in Component.words {
                    let component = Component(id: nil, name: word)
                    component.save() { _, _ in }
                }

                response.send("Success!")
            }
        }

        router.get("") { request, response, next in
            makeArchitecture { architecture in
                do {
                    try response.render("home", context: ["architecture": architecture])
                } catch {
                    print("Failed to render home page.")
                }
            }
        }

        router.get("architecture") { request, response, next in
            makeArchitecture { architecture in
                response.send(architecture)
            }
        }

        return router
    }()
}

func makeArchitecture(_ completion: @escaping (Architecture) -> Void) {
    Component.findAll() { existing, error in
        guard let existing = existing else {
            fatalError("You need to run the setup route first.")
        }

        let minWords: UInt32 = 3
        let maxWords: UInt32 = 5
        let componentCount = Int(arc4random_uniform(maxWords - minWords) + minWords)

        let shuffled = existing.shuffled()
        let selected = Array(shuffled.prefix(upTo: componentCount))

        let components = selected.map { $0.name }
        let name = components.joined(separator: " ")
        let initialism = components.map { String($0.first!) }.joined()

        completion(Architecture(components: components, name: name, initialism: initialism))
    }
}

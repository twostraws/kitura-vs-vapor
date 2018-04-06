import Routing
import Vapor


// simplest possible array shuffle
extension Array {
    func shuffled() -> [Element] {
        return self.sorted { _, _ in arc4random() < arc4random() }
    }
}

public func routes(_ router: Router) throws {
    router.get("setup") { req -> Future<String> in
        let components = Component.query(on: req).all()

        return components.map(to: String.self) { existing in
            guard existing.count == 0 else {
                return "Existing components already made"
            }

            for word in Component.words {
                let component = Component(id: nil, name: word)
                _ = component.save(on: req)
            }

            return "Success"
        }
    }

    router.get { req in
        return makeArchitecture(on: req).flatMap(to: View.self) { architecture in
            return try req.view().render("home", architecture)
        }
    }

    router.get("architecture") { req -> Future<Architecture> in
        return makeArchitecture(on: req)
    }
}

func makeArchitecture(on req: Request) -> Future<Architecture> {
    return Component.query(on: req).all().map(to: Architecture.self) { components in
        let minWords: UInt32 = 3
        let maxWords: UInt32 = 5
        let componentCount = Int(arc4random_uniform(maxWords - minWords) + minWords)

        let shuffled = components.shuffled()
        let selected = Array(shuffled.prefix(upTo: componentCount))

        let components = selected.map { $0.name }
        let name = components.joined(separator: " ")
        let initialism = components.map { String($0.first!) }.joined()
        return Architecture(components: components, name: name, initialism: initialism)
    }
}

import Foundation
import Kitura
import SwiftKueryORM
import SwiftKuerySQLite
import KituraStencil

let pool = SQLiteConnection.createPool(filename: "kiturasqlite.db", poolOptions: ConnectionPoolOptions(initialCapacity: 10, maxCapacity: 50, timeout: 10000))
Database.default = Database(pool)

do {
    try Component.createTableSync()
} catch {
    // creation failed – table probably exists already?
}

let app = App()
app.router.setDefault(templateEngine: StencilTemplateEngine())

Kitura.addHTTPServer(onPort: 8090, with: app.router)
Kitura.run()

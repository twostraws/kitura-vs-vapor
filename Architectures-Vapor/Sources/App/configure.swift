import FluentSQLite
import Leaf
import Vapor

/// Called before your application initializes.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#configureswift)
public func configure(
    _ config: inout Config,
    _ env: inout Environment,
    _ services: inout Services
) throws {
    // Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    // Configure the rest of your application here
    try services.register(LeafProvider())
    config.prefer(LeafRenderer.self, for: TemplateRenderer.self)

    try services.register(FluentSQLiteProvider())
    let sqlite = try SQLiteDatabase(storage: .memory)

    var databases = DatabaseConfig()
    databases.add(database: sqlite, as: .sqlite)
    services.register(databases)

    var migrationConfig = MigrationConfig()
    migrationConfig.add(model: Component.self, database: .sqlite)
    services.register(migrationConfig)
}

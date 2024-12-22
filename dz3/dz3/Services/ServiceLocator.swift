final class ServiceLocator {
    static let shared = ServiceLocator()

    private init() {}

    private lazy var settings = Settings.shared
    private lazy var userDatabase = UserDatabase.shared
    private lazy var passwordKeychain = PasswordKeychain.shared
    private lazy var bookDatabase = BookDatabase.shared

    func getSettings() -> Settings {
        settings
    }

    func getUserDatabase() -> UserDatabase {
        userDatabase
    }

    func getPasswordKeychain() -> PasswordKeychain {
        passwordKeychain
    }

    func getBookDatabase() -> BookDatabase {
        bookDatabase
    }
}

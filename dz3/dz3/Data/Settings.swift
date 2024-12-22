final class Settings {
    static let shared = Settings()

    private init() {}

    var loggedInUser: User?
}

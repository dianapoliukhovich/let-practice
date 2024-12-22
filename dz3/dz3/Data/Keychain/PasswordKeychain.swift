final class PasswordKeychain {
    static let shared = PasswordKeychain()
    
    private init() {}
    
    private let passwords: [String: String] = [
        "ahmedova": "1",
        "harlamov": "2",
        "batrutdinov": "3"
    ]

    func getPassword(forUsername username: String) -> String? {
        return passwords[username]
    }
}

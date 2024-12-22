import UIKit
final class UserDatabase {
    static let shared = UserDatabase()
    
    private init() {}

    private let users: [String: User] = [
        "ahmedova": User(
            username: "ahmedova",
            name: "Юля Ахмедова",
            bio: "Основатель проекта “Stand Up” на канале ТНТ, член жюри телепроекта “Открытый микрофон” на канале ТНТ.",
            avatar: .People.ahmedovaAvatar
        ),
        "harlamov": User(
            username: "harlamov",
            name: "Гарик Харламов",
            bio: "Комик, актёр, телеведущий, участник шоу Comedy Club",
            avatar: .People.harlamovAvatar
        ),
        "batrutdinov": User(
            username: "batrutdinov",
            name: "Тимур Батрутдинов",
            bio: "Комик, актёр, участник шоу Comedy Club",
            avatar: .People.batrutdinovAvatar
        )
    ]

    func getUser(byUsername username: String) -> User? {
        users[username]
    }
}

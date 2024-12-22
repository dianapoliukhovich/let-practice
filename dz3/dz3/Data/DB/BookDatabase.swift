import UIKit

final class BookDatabase {
    static let shared = BookDatabase()

    private init() {}

    private var books: [Book] = [
        Book(
            id: UUID(),
            coverImageName: .Books.book1,
            title: "Анна Каренина",
            author: "Лев Толстой",
            description: "Трагическая история любви, исследующая вопросы семьи, общества и страсти. Роман о судьбе женщины, которая бросила вызов устоям общества.",
            isFavorite: true
        ),
        Book(
            id: UUID(),
            coverImageName: .Books.book2,
            title: "Портрет Дориана Грея",
            author: "Оскар Уайльд",
            description: "История молодого человека, чья красота и молодость сохраняются, пока его портрет стареет вместо него. Философский роман о морали, искусстве и последствиях.",
            isFavorite: false
        ),
        Book(
            id: UUID(),
            coverImageName: .Books.book3,
            title: "Фауст",
            author: "Иоганн Вольфганг Гёте",
            description: "Эпическая драма о человеке, заключившем договор с дьяволом, чтобы добиться знаний и наслаждений. Глубокое размышление о человеческой природе.",
            isFavorite: false
        ),
        Book(
            id: UUID(),
            coverImageName: .Books.book5,
            title: "Джейн Эйр",
            author: "Шарлотта Бронте",
            description: "История сироты, преодолевающей трудности, чтобы найти себя и свою любовь. Книга о силе духа, независимости и страсти.",
            isFavorite: false
        ),
        Book(
            id: UUID(),
            coverImageName: .Books.book4,
            title: "Три товарища",
            author: "Эрих Мария Ремарк",
            description: "Трогательная история о дружбе, любви и утрате на фоне послевоенной Германии. Роман о человеческих ценностях в тяжёлые времена.",
            isFavorite: false
        )
    ]

    func getAllBooks() -> [Book] {
        books
    }

    func getBook(byId id: UUID) -> Book? {
        books.first { $0.id == id }
    }

    func getFavoriteBooks() -> [Book] {
        books.filter { $0.isFavorite }
    }

    func toggleFavorite(for bookId: UUID) {
        if let index = books.firstIndex(where: { $0.id == bookId }) {
            books[index].isFavorite.toggle()
        }
    }
}

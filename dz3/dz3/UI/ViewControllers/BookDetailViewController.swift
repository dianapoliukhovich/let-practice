import UIKit

class BookDetailViewController: UIViewController {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!

    var book: Book?

    var completion: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        completion?()
    }

    private func setupUI() {
        guard let book else { return }
        
        coverImageView.image = book.coverImageName
        titleLabel.text = book.title
        authorLabel.text = book.author
        descriptionLabel.text = book.description

        updateFavoriteButton()
    }

    private func updateFavoriteButton() {
        guard let book else { return }
        let buttonTitle = book.isFavorite
            ? "Remove from Favorites"
            : "Add to Favorites"
        favoriteButton.setTitle(buttonTitle , for: .normal)
    }

    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
        guard let book else { return }

        ServiceLocator.shared.getBookDatabase().toggleFavorite(for: book.id)
        self.book = ServiceLocator.shared.getBookDatabase().getBook(byId: book.id)

        updateFavoriteButton()
    }
}

import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    var favoriteBooks: [Book] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        favoriteBooks = ServiceLocator.shared.getBookDatabase().getFavoriteBooks()

        setupViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tabBarController?.navigationItem.title = "Favorites"
        favoriteBooks = ServiceLocator.shared.getBookDatabase().getFavoriteBooks()
        collectionView.reloadData()
    }

    private func setupViews() {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = cellSize
            layout.estimatedItemSize = .zero
        }
    }

    private var cellSize: CGSize {
        let collectionViewWidth = collectionView.frame.width
        let spacing: CGFloat = 10
        let numberOfCellsPerRow: CGFloat = 3
        let totalSpacing = spacing * numberOfCellsPerRow
        let cellWidth = (collectionViewWidth - totalSpacing) / numberOfCellsPerRow
        let cellHeight = cellWidth * 1.75

        return CGSize(width: cellWidth, height: cellHeight)
    }
}

extension FavoritesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        favoriteBooks.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "FavoriteBookCell",
                for: indexPath
            ) as? FavoriteBookCell
        else {
            return UICollectionViewCell()
        }

        let book = favoriteBooks[indexPath.row]
        cell.configure(with: book)

        return cell
    }
}

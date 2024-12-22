import UIKit

class FavoriteBookCell: UICollectionViewCell {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    func configure(with book: Book) {
        coverImageView.layer.cornerRadius = 7

        titleLabel.text = book.title
        coverImageView.image = book.coverImageName
    }
}

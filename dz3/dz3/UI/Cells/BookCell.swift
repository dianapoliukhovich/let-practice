import UIKit

class BookCell: UITableViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var favoriteIndicator: UIImageView!

    func configure(with book: Book) {
        coverImageView.layer.cornerRadius = 7

        titleLabel.text = book.title
        authorLabel.text = book.author
        coverImageView.image = book.coverImageName
        
        favoriteIndicator.image = UIImage(systemName: book.isFavorite ? "star.fill" : "star")
    }
}




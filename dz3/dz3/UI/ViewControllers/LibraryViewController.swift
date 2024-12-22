import UIKit

class LibraryViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var books: [Book] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        books = ServiceLocator.shared.getBookDatabase().getAllBooks()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.navigationItem.title = "Library"
    }
}

extension LibraryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        books.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "BookCell",
                for: indexPath
            ) as? BookCell
        else {
            return UITableViewCell()
        }
        let book = books[indexPath.row]
        cell.configure(with: book)
        return cell
    }
}

extension LibraryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard
            let detailVC = ViewControllers.bookDetailViewController
        else {
            return
        }
        detailVC.book = books[indexPath.row]
        detailVC.completion = { [weak self] in
            self?.books = ServiceLocator.shared.getBookDatabase().getAllBooks()
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        present(detailVC, animated: true)
    }
}

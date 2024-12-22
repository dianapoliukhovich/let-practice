import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet private weak var formView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    
    var userName: String?
    var userBio: String?
    var userAvatar: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarController?.navigationItem.hidesBackButton = true

        setupViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.navigationItem.title = "Profile"
    }

    private func setupViews() {
        formView.layer.cornerRadius = 11
        avatarImageView.layer.cornerRadius = 7
        logoutButton.layer.cornerRadius = 7

        let user = ServiceLocator.shared.getSettings().loggedInUser

        nameLabel.text = user?.name
        bioLabel.text = user?.bio
        avatarImageView.image = user?.avatar
    }

    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        guard
            let authVC = navigationController?.viewControllers.first
        else { return }
        ServiceLocator.shared.getSettings().loggedInUser = nil
        navigationController?.setViewControllers([authVC], animated: true)
    }
}

import UIKit

enum ViewControllerIdentifiers {
    static let profileViewController = "ProfileViewController"
    static let tabbarController = "TabbarController"
    static let bookDetailViewController = "BookDetailViewController"
}

enum ViewControllers {
    static var profileViewController: ProfileViewController? {
        Storyboards
            .main
            .instantiateViewController(
                withIdentifier: ViewControllerIdentifiers.profileViewController
            ) as? ProfileViewController
    }
    static var tabbarController: UITabBarController? {
        Storyboards
            .main
            .instantiateViewController(
                withIdentifier: ViewControllerIdentifiers.tabbarController
            ) as? UITabBarController
    }
    static var bookDetailViewController: BookDetailViewController? {
        Storyboards
            .main
            .instantiateViewController(
                withIdentifier: ViewControllerIdentifiers.bookDetailViewController
            ) as? BookDetailViewController
    }
}

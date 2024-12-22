import UIKit

class AuthViewController: UIViewController {

    @IBOutlet private weak var formView: UIView!
    @IBOutlet private weak var loginTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Login"

        setupViews()
    }

    private func setupViews() {
        formView.layer.cornerRadius = 11
        loginButton.layer.cornerRadius = 7
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard
            let login = loginTextField.text,
            let password = passwordTextField.text
        else { return }

        let userDatabase = ServiceLocator.shared.getUserDatabase()
        let passwordKeychain = ServiceLocator.shared.getPasswordKeychain()

        if
            let user = userDatabase.getUser(byUsername: login),
            let storedPassword = passwordKeychain.getPassword(forUsername: login),
            storedPassword == password
        {
            openDetails(for: user)
        } else {
            showAlert()
        }
    }

    private func showAlert() {
        let alert = UIAlertController(
            title: "Ошибка",
            message: "Неверный логин или пароль",
            preferredStyle: .alert
        )

        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default
            )
        )
        present(alert, animated: true)
    }

    private func openDetails(for user: User) {
        guard
            let tabbarVC = ViewControllers.tabbarController
        else {
            return
        }
        ServiceLocator.shared.getSettings().loggedInUser = user
        navigationController?.pushViewController(tabbarVC, animated: true)
    }
}

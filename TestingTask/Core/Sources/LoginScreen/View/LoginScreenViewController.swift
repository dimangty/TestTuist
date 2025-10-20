//
//  LoginScreenViewController.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

import UIKit

class LoginScreenViewController: UIViewController {
    
    var presenter: LoginScreenViewOutput?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        presenter?.loginButtonTapped(username: username, password: password)
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        presenter?.signUpButtonTapped()
    }
}

extension LoginScreenViewController: LoginScreenViewInput {
    func setup() {
        view.backgroundColor = .white
        setupUI()
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    func navigateToHome() {
        
    }
    
    func clearFields() {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func setupUI() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        titleLabel.textAlignment = .center
        
        usernameTextField.placeholder = "Username"
        usernameTextField.borderStyle = .roundedRect
        
        passwordTextField.placeholder = "Password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .systemBlue
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 8
        
        signUpButton.setTitle("Don't have an account? Sign Up", for: .normal)
        signUpButton.setTitleColor(.systemBlue, for: .normal)
    }
}

extension LoginScreenViewController: ViperModuleTransitionHandler {}
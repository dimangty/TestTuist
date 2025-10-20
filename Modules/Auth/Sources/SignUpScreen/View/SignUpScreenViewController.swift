import Core
//
//  SignUpScreenViewController.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

import UIKit

class SignUpScreenViewController: UIViewController {
    
    var presenter: SignUpScreenViewOutput?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        let username = usernameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        presenter?.signUpButtonTapped(username: username, email: email, password: password, firstName: firstName, lastName: lastName)
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        presenter?.loginButtonTapped()
    }
}

extension SignUpScreenViewController: SignUpScreenViewInput {
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
        emailTextField.text = ""
        passwordTextField.text = ""
        firstNameTextField.text = ""
        lastNameTextField.text = ""
    }
    
    private func setupUI() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        titleLabel.textAlignment = .center
        
        usernameTextField.placeholder = "Username"
        usernameTextField.borderStyle = .roundedRect
        
        emailTextField.placeholder = "Email"
        emailTextField.borderStyle = .roundedRect
        emailTextField.keyboardType = .emailAddress
        
        passwordTextField.placeholder = "Password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        
        firstNameTextField.placeholder = "First Name"
        firstNameTextField.borderStyle = .roundedRect
        
        lastNameTextField.placeholder = "Last Name"
        lastNameTextField.borderStyle = .roundedRect
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.backgroundColor = .systemBlue
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.layer.cornerRadius = 8
        
        loginButton.setTitle("Already have an account? Login", for: .normal)
        loginButton.setTitleColor(.systemBlue, for: .normal)
    }
}

extension SignUpScreenViewController: ViperModuleTransitionHandler {}
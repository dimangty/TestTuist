import Core
//
//  ProfileScreenViewController.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

import UIKit

class ProfileScreenViewController: UIViewController {
    
    var presenter: ProfileScreenViewOutput?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        presenter?.backButtonTapped()
    }
}

extension ProfileScreenViewController: ProfileScreenViewInput {
    func setup() {
        view.backgroundColor = .white
        setupUI()
    }
    
    func updateUserInfo(user: UserModel) {
        usernameLabel.text = "Username: \(user.username)"
        emailLabel.text = "Email: \(user.email)"
        fullNameLabel.text = "Name: \(user.firstName) \(user.lastName)"
    }
    
    private func setupUI() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        titleLabel.textAlignment = .center
        titleLabel.text = "Profile"
        
        usernameLabel.font = UIFont.systemFont(ofSize: 18)
        emailLabel.font = UIFont.systemFont(ofSize: 18)
        fullNameLabel.font = UIFont.systemFont(ofSize: 18)
        
        backButton.setTitle("Back", for: .normal)
        backButton.backgroundColor = .systemBlue
        backButton.setTitleColor(.white, for: .normal)
        backButton.layer.cornerRadius = 8
    }
}

extension ProfileScreenViewController: ViperModuleTransitionHandler {}


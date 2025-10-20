import Core
//
//  HomeScreenViewController.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    var presenter: HomeScreenViewOutput?
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
    }
    
    @IBAction func profileButtonTapped(_ sender: UIButton) {
        presenter?.profileButtonTapped()
    }

    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        presenter?.logoutButtonTapped()
    }
}

extension HomeScreenViewController: HomeScreenViewInput {
    func setup() {
        view.backgroundColor = .white
        setupUI()
    }
    
    func updateWelcomeMessage(username: String) {
        welcomeLabel.text = "Welcome, \(username)!"
    }
    
    private func setupUI() {
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 24)
        welcomeLabel.textAlignment = .center
        
        profileButton.setTitle("Profile", for: .normal)
        profileButton.backgroundColor = .systemBlue
        profileButton.setTitleColor(.white, for: .normal)
        profileButton.layer.cornerRadius = 8
        
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.backgroundColor = .systemRed
        logoutButton.setTitleColor(.white, for: .normal)
        logoutButton.layer.cornerRadius = 8
    }
}

extension HomeScreenViewController: ViperModuleTransitionHandler {}


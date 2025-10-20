//
//  SplashScreenViewController.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    var presenter: SplashScreenViewOutput?
    
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewLoaded()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.presenter?.splashFinished()
        }
    }
}

extension SplashScreenViewController: SplashScreenViewInput {
    func setup() {
        view.backgroundColor = .systemBlue
        setupUI()
    }
    
    func showAppName() {
        appNameLabel.text = "TestingTask"
        
        UIView.animate(withDuration: 1.0) {
            self.appNameLabel.alpha = 1.0
            self.logoImageView.alpha = 1.0
        }
    }
    
    func navigateToNextScreen() {
        
    }
    
    private func setupUI() {
        appNameLabel.alpha = 0.0
        logoImageView.alpha = 0.0
        appNameLabel.font = UIFont.boldSystemFont(ofSize: 32)
        appNameLabel.textColor = .white
        appNameLabel.textAlignment = .center
    }
}

extension SplashScreenViewController: ViperModuleTransitionHandler {}
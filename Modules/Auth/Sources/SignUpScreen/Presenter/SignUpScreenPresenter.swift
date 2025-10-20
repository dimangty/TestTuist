import Core
//
//  SignUpScreenPresenter.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

class SignUpScreenPresenter {
    private weak var view: SignUpScreenViewInput?
    private let router: SignUpScreenRouterInput

    @Injected var authService: AuthService?
    @Injected var progressService: ProgressService?
    
    init(view: SignUpScreenViewInput, router: SignUpScreenRouterInput) {
        self.view = view
        self.router = router
    }
}

extension SignUpScreenPresenter: SignUpScreenViewOutput {
    func viewLoaded() {
        self.view?.setup()
    }
    
    func signUpButtonTapped(username: String, email: String, password: String, firstName: String, lastName: String) {
        guard !username.isEmpty && !email.isEmpty && !password.isEmpty && !firstName.isEmpty && !lastName.isEmpty else {
            view?.showError(message: "Please fill in all fields")
            return
        }
        
        progressService?.show()
        
        authService?.signUp(username: username, email: email, password: password, firstName: firstName, lastName: lastName) { [weak self] result in
            self?.progressService?.hide()
            
            switch result {
            case .success(_):
                self?.view?.clearFields()
                self?.router.openHomeScreen()
            case .failure(let error):
                self?.view?.showError(message: error.localizedDescription)
            }
        }
    }
    
    func loginButtonTapped() {
        router.openLoginScreen()
    }
}
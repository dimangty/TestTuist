//
//  LoginScreenPresenter.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

class LoginScreenPresenter {
    private weak var view: LoginScreenViewInput?
    private let router: LoginScreenRouterInput

    @Injected var authService: AuthService?
    @Injected var progressService: ProgressService?
    
    init(view: LoginScreenViewInput, router: LoginScreenRouterInput) {
        self.view = view
        self.router = router
    }
}

extension LoginScreenPresenter: LoginScreenViewOutput {
    func viewLoaded() {
        self.view?.setup()
    }
    
    func loginButtonTapped(username: String, password: String) {
        guard !username.isEmpty && !password.isEmpty else {
            view?.showError(message: "Please fill in all fields")
            return
        }
        
        progressService?.show()
        
        authService?.login(username: username, password: password) { [weak self] result in
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
    
    func signUpButtonTapped() {
        router.openSignUpScreen()
    }
}
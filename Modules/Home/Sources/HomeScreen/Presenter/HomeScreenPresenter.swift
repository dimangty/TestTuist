import Core
//
//  HomeScreenPresenter.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

class HomeScreenPresenter {
    private weak var view: HomeScreenViewInput?
    private let router: HomeScreenRouterInput

    @Injected var authService: AuthService?
    
    init(view: HomeScreenViewInput, router: HomeScreenRouterInput) {
        self.view = view
        self.router = router
    }
}

extension HomeScreenPresenter: HomeScreenViewOutput {
    func viewLoaded() {
        self.view?.setup()
        
        if let user = authService?.getCurrentUser() {
            view?.updateWelcomeMessage(username: user.username)
        }
    }
    
    func profileButtonTapped() {
        router.openProfileScreen()
    }
    
    func logoutButtonTapped() {
        authService?.logout()
        router.openLoginScreen()
    }
}


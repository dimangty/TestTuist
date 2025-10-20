import Core
//
//  ProfileScreenPresenter.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

class ProfileScreenPresenter {
    private weak var view: ProfileScreenViewInput?
    private let router: ProfileScreenRouterInput

    @Injected var authService: AuthService?
    
    init(view: ProfileScreenViewInput, router: ProfileScreenRouterInput) {
        self.view = view
        self.router = router
    }
}

extension ProfileScreenPresenter: ProfileScreenViewOutput {
    func viewLoaded() {
        self.view?.setup()
        
        if let user = authService?.getCurrentUser() {
            view?.updateUserInfo(user: user)
        }
    }
    
    func backButtonTapped() {
        router.navigateBack()
    }
}


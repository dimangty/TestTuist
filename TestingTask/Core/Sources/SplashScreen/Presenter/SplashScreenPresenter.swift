//
//  SplashScreenPresenter.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

class SplashScreenPresenter {
    private weak var view: SplashScreenViewInput?
    private let router: SplashScreenRouterInput

    @Injected var authService: AuthService?
    
    init(view: SplashScreenViewInput, router: SplashScreenRouterInput) {
        self.view = view
        self.router = router
    }
}

extension SplashScreenPresenter: SplashScreenViewOutput {
    func viewLoaded() {
        self.view?.setup()
        self.view?.showAppName()
    }
    
    func splashFinished() {
        if let authService = authService, authService.isLoggedIn() {
            router.openMainScreen()
        } else {
            router.openLoginScreen()
        }
    }
}
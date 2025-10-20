//
//  SplashScreenRouter.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

import UIKit

class SplashScreenRouter {
    weak var viewController: UIViewController?
    weak var transitionHandler: ViperModuleTransitionHandler?

    func createModule() -> UIViewController? {
        let vc = SplashScreenViewController.loadFromXib()

        transitionHandler = vc

        let presenter = SplashScreenPresenter(view: vc, router: self)

        vc.presenter = presenter

        self.viewController = vc

        return self.viewController
    }

    func openModule(with transitionHandler: ViperModuleTransitionHandler, transitionStyle: TransitionStyle) {
        if let vc = createModule() {
            transitionHandler.openModule(vc: vc, style: transitionStyle)
        }
    }
}

extension SplashScreenRouter: SplashScreenRouterInput {
    func openLoginScreen() {
        if let transitionHandler = self.transitionHandler {
            LoginScreenRouter().openModule(with: transitionHandler, transitionStyle: .push)
        }
    }
    
    func openMainScreen() {
        if let transitionHandler = self.transitionHandler {
            HomeScreenRouter().openModule(with: transitionHandler, transitionStyle: .push)
        }
    }
}

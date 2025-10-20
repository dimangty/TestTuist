//
//  LoginScreenRouter.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

import UIKit

class LoginScreenRouter {
    weak var viewController: UIViewController?
    weak var transitionHandler: ViperModuleTransitionHandler?

    func createModule() -> UIViewController? {
        let vc = LoginScreenViewController.loadFromXib()

        transitionHandler = vc

        let presenter = LoginScreenPresenter(view: vc, router: self)

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

extension LoginScreenRouter: LoginScreenRouterInput {
    func openSignUpScreen() {
        if let transitionHandler = self.transitionHandler {
            SignUpScreenRouter().openModule(with: transitionHandler, transitionStyle: .push)
        }
    }
    
    func openHomeScreen() {
        if let transitionHandler = self.transitionHandler {
            HomeScreenRouter().openModule(with: transitionHandler, transitionStyle: .push)
        }
    }
}

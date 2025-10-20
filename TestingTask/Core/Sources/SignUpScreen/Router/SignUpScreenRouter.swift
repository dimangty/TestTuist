//
//  SignUpScreenRouter.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

import UIKit

class SignUpScreenRouter {
    weak var viewController: UIViewController?
    weak var transitionHandler: ViperModuleTransitionHandler?

    func createModule() -> UIViewController? {
        let vc = SignUpScreenViewController.loadFromXib()

        transitionHandler = vc

        let presenter = SignUpScreenPresenter(view: vc, router: self)

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

extension SignUpScreenRouter: SignUpScreenRouterInput {
    func openLoginScreen() {
        if let transitionHandler = self.transitionHandler {
            transitionHandler.popModule()
        }
    }
    
    func openHomeScreen() {
        if let transitionHandler = self.transitionHandler {
            HomeScreenRouter().openModule(with: transitionHandler, transitionStyle: .pushFade)
        }
    }
}
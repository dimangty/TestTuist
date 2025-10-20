//
//  HomeScreenRouter.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

import UIKit

class HomeScreenRouter {
    weak var viewController: UIViewController?
    weak var transitionHandler: ViperModuleTransitionHandler?

    func createModule() -> UIViewController? {
        let vc = HomeScreenViewController.loadFromXib()

        transitionHandler = vc

        let presenter = HomeScreenPresenter(view: vc, router: self)

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

extension HomeScreenRouter: HomeScreenRouterInput {
    func openProfileScreen() {
        if let transitionHandler = self.transitionHandler {
            ProfileScreenRouter().openModule(with: transitionHandler, transitionStyle: .push)
        }
    }
    
    func openLoginScreen() {
        if let transitionHandler = self.transitionHandler {
            let loginRouter = LoginScreenRouter()
            if let loginVC = loginRouter.createModule() {
                let navigationController = UINavigationController(rootViewController: loginVC)
                navigationController.isNavigationBarHidden = true
                transitionHandler.swapAndPopToRootViewController(vc: loginVC)
            }
        }
    }
}

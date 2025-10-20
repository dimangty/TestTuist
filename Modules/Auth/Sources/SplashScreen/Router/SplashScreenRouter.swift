import Core
//
//  SplashScreenRouter.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

import UIKit

public class SplashScreenRouter {
    weak var viewController: UIViewController?
    weak var transitionHandler: ViperModuleTransitionHandler?
    
    public init() {}

    public func createModule() -> UIViewController? {
        let vc = SplashScreenViewController.loadFromXib(bundle: .module)

        transitionHandler = vc

        let presenter = SplashScreenPresenter(view: vc, router: self)

        vc.presenter = presenter

        self.viewController = vc

        return self.viewController
    }

    public func openModule(with transitionHandler: ViperModuleTransitionHandler, transitionStyle: TransitionStyle) {
        if let vc = createModule() {
            transitionHandler.openModule(vc: vc, style: transitionStyle, completion: nil)
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
            // For now, navigate to login screen instead of home
            // This will be handled properly in the main app coordinator
            LoginScreenRouter().openModule(with: transitionHandler, transitionStyle: .push)
        }
    }
}

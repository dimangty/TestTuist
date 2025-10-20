import Core
//
//  SignUpScreenRouter.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

import UIKit

public class SignUpScreenRouter {
    weak var viewController: UIViewController?
    weak var transitionHandler: ViperModuleTransitionHandler?
    
    public init() {}

    public func createModule() -> UIViewController? {
        let vc = SignUpScreenViewController.loadFromXib(bundle: .module)

        transitionHandler = vc

        let presenter = SignUpScreenPresenter(view: vc, router: self)

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

extension SignUpScreenRouter: SignUpScreenRouterInput {
    func openLoginScreen() {
        if let transitionHandler = self.transitionHandler {
            transitionHandler.popModule()
        }
    }
    
    func openHomeScreen() {
        if let transitionHandler = self.transitionHandler {
            // For now, navigate to login screen instead of home
            // This will be handled properly in the main app coordinator
            LoginScreenRouter().openModule(with: transitionHandler, transitionStyle: .pushFade)
        }
    }
}
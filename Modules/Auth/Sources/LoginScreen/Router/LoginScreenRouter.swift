import Core
//
//  LoginScreenRouter.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

import UIKit
import Core

public class LoginScreenRouter {
    weak var viewController: UIViewController?
    weak var transitionHandler: ViperModuleTransitionHandler?
    
    public init() {}

    public func createModule() -> UIViewController? {
        let vc = LoginScreenViewController.loadFromXib(bundle: .module)

        transitionHandler = vc

        let presenter = LoginScreenPresenter(view: vc, router: self)

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

extension LoginScreenRouter: LoginScreenRouterInput {
    func openSignUpScreen() {
        if let transitionHandler = self.transitionHandler {
            SignUpScreenRouter().openModule(with: transitionHandler, transitionStyle: .push)
        }
    }
    
    func openHomeScreen() {
        if let transitionHandler = self.transitionHandler {
            // For now, just pop back - this will be handled properly in the main app coordinator
            transitionHandler.popToRootViewController()
        }
    }
}

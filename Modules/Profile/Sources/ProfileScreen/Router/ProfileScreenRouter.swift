import Core
//
//  ProfileScreenRouter.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

import UIKit

public class ProfileScreenRouter {
    weak var viewController: UIViewController?
    weak var transitionHandler: ViperModuleTransitionHandler?
    
    public init() {}

    public func createModule() -> UIViewController? {
        let vc = ProfileScreenViewController.loadFromXib(bundle: .module)

        transitionHandler = vc

        let presenter = ProfileScreenPresenter(view: vc, router: self)

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

extension ProfileScreenRouter: ProfileScreenRouterInput {
    func navigateBack() {
        if let transitionHandler = self.transitionHandler {
            transitionHandler.popModule()
        }
    }
}
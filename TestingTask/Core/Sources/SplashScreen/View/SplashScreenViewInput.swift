//
//  SplashScreenViewInput.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

protocol SplashScreenViewInput: AnyObject {
    func setup()
    func showAppName()
    func navigateToNextScreen()
}
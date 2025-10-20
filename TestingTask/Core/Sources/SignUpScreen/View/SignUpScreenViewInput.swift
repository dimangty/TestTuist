//
//  SignUpScreenViewInput.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

protocol SignUpScreenViewInput: AnyObject {
    func setup()
    func showError(message: String)
    func navigateToHome()
    func clearFields()
}
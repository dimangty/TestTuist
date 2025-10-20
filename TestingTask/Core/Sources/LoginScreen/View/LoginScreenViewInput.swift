//
//  LoginScreenViewInput.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

protocol LoginScreenViewInput: AnyObject {
    func setup()
    func showError(message: String)
    func navigateToHome()
    func clearFields()
}
import Core
//
//  SignUpScreenViewOutput.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

protocol SignUpScreenViewOutput: AnyObject {
    func viewLoaded()
    func signUpButtonTapped(username: String, email: String, password: String, firstName: String, lastName: String)
    func loginButtonTapped()
}
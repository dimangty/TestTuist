import Core
//
//  LoginScreenViewOutput.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

protocol LoginScreenViewOutput: AnyObject {
    func viewLoaded()
    func loginButtonTapped(username: String, password: String)
    func signUpButtonTapped()
}
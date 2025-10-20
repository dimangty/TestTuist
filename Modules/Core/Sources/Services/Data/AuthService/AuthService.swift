//
//  AuthService.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

import Foundation

public protocol IAuthService {
    func login(username: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void)
    func signUp(username: String, email: String, password: String, firstName: String, lastName: String, completion: @escaping (Result<UserModel, Error>) -> Void)
    func logout()
    func getCurrentUser() -> UserModel?
    func isLoggedIn() -> Bool
}

public class AuthService: IAuthService {
    
    private var currentUser: UserModel?
    
    public func login(username: String, password: String, completion: @escaping (Result<UserModel, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            if username == "demo" && password == "password" {
                let user = UserModel(username: username, email: "demo@example.com", firstName: "Demo", lastName: "User")
                self.currentUser = user
                completion(.success(user))
            } else {
                let error = NSError(domain: "AuthError", code: 401, userInfo: [NSLocalizedDescriptionKey: "Invalid username or password"])
                completion(.failure(error))
            }
        }
    }
    
    public func signUp(username: String, email: String, password: String, firstName: String, lastName: String, completion: @escaping (Result<UserModel, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            if username.count >= 3 && email.contains("@") && password.count >= 6 {
                let user = UserModel(username: username, email: email, firstName: firstName, lastName: lastName)
                self.currentUser = user
                completion(.success(user))
            } else {
                let error = NSError(domain: "AuthError", code: 400, userInfo: [NSLocalizedDescriptionKey: "Invalid registration data"])
                completion(.failure(error))
            }
        }
    }
    
    public func logout() {
        currentUser = nil
    }
    
    public func getCurrentUser() -> UserModel? {
        return currentUser
    }
    
    public func isLoggedIn() -> Bool {
        return currentUser != nil
    }
}

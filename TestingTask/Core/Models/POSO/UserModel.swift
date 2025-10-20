//
//  UserModel.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

import Foundation

struct UserModel {
    let id: String
    let username: String
    let email: String
    let firstName: String
    let lastName: String
    let avatarURL: String?
    
    init(id: String = UUID().uuidString, username: String, email: String, firstName: String, lastName: String, avatarURL: String? = nil) {
        self.id = id
        self.username = username
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.avatarURL = avatarURL
    }
}
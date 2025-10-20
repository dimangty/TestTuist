//
//  UserModel.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

import Foundation

public struct UserModel {
    public let id: String
    public let username: String
    public let email: String
    public let firstName: String
    public let lastName: String
    public let avatarURL: String?
    
    public init(id: String = UUID().uuidString, username: String, email: String, firstName: String, lastName: String, avatarURL: String? = nil) {
        self.id = id
        self.username = username
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.avatarURL = avatarURL
    }
}
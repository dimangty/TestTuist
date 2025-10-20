//
//  ProfileScreenViewInput.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

protocol ProfileScreenViewInput: AnyObject {
    func setup()
    func updateUserInfo(user: UserModel)
}
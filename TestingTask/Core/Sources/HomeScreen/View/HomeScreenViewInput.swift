//
//  HomeScreenViewInput.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

protocol HomeScreenViewInput: AnyObject {
    func setup()
    func updateWelcomeMessage(username: String)
}
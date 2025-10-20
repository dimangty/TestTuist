import Core
//
//  HomeScreenViewOutput.swift
//  TestingTask
//
//  Created by Claude on 20.10.2025.
//

protocol HomeScreenViewOutput: AnyObject {
    func viewLoaded()
    func profileButtonTapped()
    func logoutButtonTapped()
}

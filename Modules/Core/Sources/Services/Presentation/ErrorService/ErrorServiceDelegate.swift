//
//  ErrorServiceDelegate.swift
//  EvrazAuth
//
//  Created by DBykov on 25.04.2021.
//  Copyright © 2018 MSTeam. All rights reserved.
//

import Foundation

public protocol ErrorServiceDelegate: class {
    func needAuthorization()
}

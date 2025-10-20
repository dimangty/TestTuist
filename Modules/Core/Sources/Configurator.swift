//
//  Configurator.swift
//  TestingTask
//
//  Created by DBykov on 19.07.2022.
//

import Foundation
public class Configurator {
    public static let shared = Configurator()
    public let serviceLocator = ServiceLocator()

    public func setup() {
        registerServices()
    }
    
   private func registerServices() {
       serviceLocator.addService(service: Obfuscator())
       serviceLocator.addService(service: CurrateService())
       serviceLocator.addService(service: ErrorService())
       serviceLocator.addService(service: ProgressService())
       serviceLocator.addService(service: CacheService(lifeTime: 500))
       serviceLocator.addService(service: AuthService())
       
    }
}

//
//  CurrencyRatesDTO.swift
//  TestingTask
//
//  Created by DBykov on 19.07.2022.
//

import Foundation
public struct CurrencyRatesDTO: Codable {
    let message: String
    let data: [String: String]
}

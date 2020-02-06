//
//  City.swift
//  Entities
//
//  Created by Mena Bebawy on 2/6/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation

public struct City: Decodable {
    public let id: Double
    public let name: String
    public let weather: [Weather]
}

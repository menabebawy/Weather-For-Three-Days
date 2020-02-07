//
//  Forecast.swift
//  Entities
//
//  Created by Mena Bebawy on 2/7/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation

public struct Forecast: Decodable {
    public let date: Double
    public let weather: [Weather]
    public let main: Main
    
    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case weather = "weather"
        case main = "main"
    }
}

//
//  Forecasts.swift
//  Entities
//
//  Created by user165891 on 2/7/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation

public struct Forecasts: Decodable {
    public let cnt: Int
    public let list: [Forecast]
}

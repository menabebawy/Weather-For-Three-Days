//
//  Main.swift
//  Entities
//
//  Created by Mena Bebawy on 2/6/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation

public struct Main: Decodable {
    let temp: Float
    
    /// Use to return temprature without decimal
    public func temperature() -> String {
        String(format: "%.0f", temp)
    }
    
    /// Use to return temperature in Celsius style
    public func celsiusTemperatureStyle() -> String {
        temperature() + "º"
    }
    
}

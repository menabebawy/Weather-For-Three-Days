//
//  Float+Extension.swift
//  Utils
//
//  Created by Mena Bebawy on 2/8/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation

public extension Float {
    
    /// Use to return temperature in Celsius style
    func celsiusTemperatureStyle() -> String {
        String(format: "%.0f", self) + "º"
    }

}

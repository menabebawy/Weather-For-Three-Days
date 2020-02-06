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
    
    public func temperature() -> String {
        return String(format: "%.0f", temp)
    }

}

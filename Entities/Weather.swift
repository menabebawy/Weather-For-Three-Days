//
//  Weather.swift
//  Entities
//
//  Created by user165891 on 2/6/20.
//  Copyright © 2020 Mena. All rights reserved.
//

import Foundation

public struct Weather: Decodable {
    public let id: Int
    public let main: String
    public let description: String
    public let icon: String

    public var iconURL: String {
        return "http://openweathermap.org/img/wn/" + icon + ".png"
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case description = "description"
        case icon = "icon"
    }

}

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
    public let icon: String
    
    private var baseIconUrl: String {
        return "http://openweathermap.org/img/wn/"
    }

    public var iconURL: String {
        return  baseIconUrl + icon + ".png"
    }
    
    public var icon2XUrl: String {
        return baseIconUrl + icon + "@2x.png"
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case main = "main"
        case icon = "icon"
    }

}

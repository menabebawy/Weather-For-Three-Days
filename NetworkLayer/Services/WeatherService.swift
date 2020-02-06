//
//  WeatherService.swift
//  NetworkLayer
//
//  Created by Marcin Jackowski on 06/09/2018.
//  Copyright © 2018 CocoApps. All rights reserved.
//

import Foundation

public enum WeatherService: ServiceProtocol {

    case city(name: String)
    case cities(idsString: String)

    public var baseURL: URL {
        return URL(string: "http://api.openweathermap.org/data/2.5/")!
    }

    public var path: String {
        switch self {
        case .city:
            return "weather"
        case .cities:
            return "group"
        }
    }

    public var method: HTTPMethod {
        return .get
    }
    
    public var task: Task {
        var parameters: [String: Any] = [:]
        
        switch self {
        case .city(let name):
            parameters["q"] = name
        case .cities(let ids):
            parameters["id"] = ids
        }
        
        parameters["units"] = "metric"
        parameters["APPID"] = "7764fcb1cae95e2051b8d0bba8c7d962"
        
        return .requestParameters(parameters)
    }
    
    public var headers: Headers? {
        return nil
    }

    public var parametersEncoding: ParametersEncoding {
        return .url
    }

}

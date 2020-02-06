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

    public var baseURL: URL {
        return URL(string: "http://openweathermap.org/")!
    }

    public var path: String {
        switch self {
        case .city:
            return ""
        }
    }

    public var method: HTTPMethod {
        return .get
    }

    public var task: Task {
        switch self {
        case .city:
            return .requestPlain
        }
    }

    public var headers: Headers? {
        return nil
    }

    public var parametersEncoding: ParametersEncoding {
        return .url
    }

}

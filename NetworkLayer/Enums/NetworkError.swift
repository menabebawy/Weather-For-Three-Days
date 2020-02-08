//
//  NetworkError.swift
//  NetworkLayer
//
//  Created by Marcin Jackowski on 06/09/2018.
//  Copyright © 2018 CocoApps. All rights reserved.
//

public enum NetworkError: Error {
    case unknown
    case noJSONData
    case invalidApiKey
    case nothingToGeoCode
    
    func description() -> String {
        switch self {
        case .unknown:
            return "Unknow error"
        case .noJSONData:
            return "No JSON Data"
        case .invalidApiKey:
            return "Invalid API key"
        case .nothingToGeoCode:
            return "Nothing to geocode"
        }
    }

}

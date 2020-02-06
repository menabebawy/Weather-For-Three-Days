//
//  URLComponentsExtension.swift
//  NetworkLayer
//
//  Created by Marcin Jackowski on 06/09/2018.
//  Copyright © 2018 CocoApps. All rights reserved.
//

import Foundation

extension URLComponents {

    init(service: ServiceProtocol) {
        let url = service.baseURL.appendingPathComponent(service.path)
        self.init(url: url, resolvingAgainstBaseURL: false)!

        guard case let .requestParameters(parameters) = service.task, service.parametersEncoding == .url else { return }

        let percentEncodedQuery = (self.percentEncodedQuery.map { $0 + "&" } ?? "") + query(parameters)
        self.percentEncodedQuery = percentEncodedQuery
    }


    public func queryComponents(fromKey key: String, value: Any) -> [(String, String)] {
        let arrayEncoding: ArrayEncoding = .noBrackets
        let boolEncoding: BoolEncoding = .numeric

        var components: [(String, String)] = []

        if let dictionary = value as? [String: Any] {
            for (nestedKey, value) in dictionary {
                components += queryComponents(fromKey: "\(key)[\(nestedKey)]", value: value)
            }
        } else if let array = value as? [Any] {
            for value in array {
                components += queryComponents(fromKey: arrayEncoding.encode(key: key), value: value)
            }
        } else if let value = value as? NSNumber {
            if value.isBool {
                components.append((escape(key), escape(boolEncoding.encode(value: value.boolValue))))
            } else {
                components.append((escape(key), escape("\(value)")))
            }
        } else if let bool = value as? Bool {
            components.append((escape(key), escape(boolEncoding.encode(value: bool))))
        } else {
            components.append((escape(key), escape("\(value)")))
        }

        return components
    }

    /// Creates a percent-escaped string following RFC 3986 for a query string key or value.
    ///
    /// - Parameter string: `String` to be percent-escaped.
    ///
    /// - Returns: The percent-escaped `String`.
    public func escape(_ string: String) -> String {
        return string.addingPercentEncoding(withAllowedCharacters: .afURLQueryAllowed) ?? string
    }
    
    private func query(_ parameters: [String: Any]) -> String {
        var components: [(String, String)] = []
        
        for key in parameters.keys.sorted(by: <) {
            let value = parameters[key]!
            components += queryComponents(fromKey: key, value: value)
        }

        return components.map { "\($0)=\($1)" }.joined(separator: "&")
    }
}

/// Configures how `Array` parameters are encoded.
public enum ArrayEncoding {
    /// An empty set of square brackets is appended to the key for every value. This is the default behavior.
    case brackets
    /// No brackets are appended. The key is encoded as is.
    case noBrackets

    func encode(key: String) -> String {
        switch self {
        case .brackets:
            return "\(key)[]"
        case .noBrackets:
            return key
        }
    }
}

/// Configures how `Bool` parameters are encoded.
public enum BoolEncoding {
    /// Encode `true` as `1` and `false` as `0`. This is the default behavior.
    case numeric
    /// Encode `true` and `false` as string literals.
    case literal

    func encode(value: Bool) -> String {
        switch self {
        case .numeric:
            return value ? "1" : "0"
        case .literal:
            return value ? "true" : "false"
        }
    }
}

public extension CharacterSet {

    static let afURLQueryAllowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@"
        let subDelimitersToEncode = "!$&'()*+,;="
        let encodableDelimiters = CharacterSet(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")

        return CharacterSet.urlQueryAllowed.subtracting(encodableDelimiters)
    }()

}

extension NSNumber {
    fileprivate var isBool: Bool { return CFBooleanGetTypeID() == CFGetTypeID(self) }
}

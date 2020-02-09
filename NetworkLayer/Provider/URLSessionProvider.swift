//
//  URLSessionProvider.swift
//  NetworkLayer
//
//  Created by Marcin Jackowski on 06/09/2018.
//  Copyright © 2018 CocoApps. All rights reserved.
//

import Foundation

public final class URLSessionProvider: ProviderProtocol {
    private var session: URLSessionProtocol
    
    public init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    public func request<T>(type: T.Type,
                           service: ServiceProtocol,
                           completion: @escaping (NetworkResponse<T>) -> Void) where T: Decodable {
        let request = URLRequest(service: service)
        let task = session.dataTask(request: request, completionHandler: { [weak self] data, response, error in
            let httpResponse = response as? HTTPURLResponse
            self?.handleDataResponse(data: data, response: httpResponse, error: error, completion: completion)
        })
        task.resume()
    }
    
    private func handleDataResponse<T: Decodable>(data: Data?,
                                                  response: HTTPURLResponse?,
                                                  error: Error?,
                                                  completion: @escaping (NetworkResponse<T>) -> Void) {
        guard error == nil else { return completion(.failure(NetworkError.unknown.description())) }
        guard let response = response else { return completion(.failure(NetworkError.noJSONData.description())) }
        
        DispatchQueue.main.async {
            switch response.statusCode {
            case 200...299:
                guard let data = data, let model = try? JSONDecoder().decode(T.self, from: data) else {
                    return completion(.failure(NetworkError.unknown.description()))
                }
                completion(.success(model))
            case 400:
                completion(.failure(NetworkError.nothingToGeoCode.description()))
            case 401:
                completion(.failure(NetworkError.invalidApiKey.description()))
            default:
                completion(.failure(NetworkError.unknown.description()))
            }
        }
    }
    
}

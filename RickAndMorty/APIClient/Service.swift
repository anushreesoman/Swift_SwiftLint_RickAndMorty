//
//  Service.swift
//  RickAndMorty
//
//  Created by Anushree Soman on 4/26/23.
//

import Foundation

/// API service object to get Rick and Morty data
final class Service {
    /// Shared singleton instance
    static let shared = Service()
    
    /// Private Initializer
    private init() {}
    
    /// Error types
    enum ServiceErrors: Error {
        case failedToCreateRequest
        case failedToLoadData
    }
    /// Execute service call to Rick and Morty API
    /// - Parameters:
    ///   - request: Request instance
    ///   - completion: Callback with data or error
    ///   - type: Type of data expected
    public func execute<T: Codable>(
        _ request: Request,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void) {
            guard let urlRequest = getURLRequest(from: request) else {
                completion(.failure(ServiceErrors.failedToCreateRequest))
                return
            }
            
            let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
                guard let data = data, error == nil else {
                    completion(.failure(error ?? ServiceErrors.failedToLoadData))
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(type, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            }
            task.resume()
    }
    
    private func getURLRequest(from request: Request) -> URLRequest? {
        guard let url = request.url else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.httpMethod
        return urlRequest
    }
}

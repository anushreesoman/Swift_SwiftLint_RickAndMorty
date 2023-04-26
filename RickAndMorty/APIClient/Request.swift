//
//  Request.swift
//  RickAndMorty
//
//  Created by Anushree Soman on 4/26/23.
//

import Foundation

/// Represents a single API call request
final class Request {
    /// API request constants
    private struct Constants {
        static let baseURL = "https://rickandmortyapi.com/api"
    }
    
    /// Required endpoint for call
    private let endpoint: Endpoint
    
    /// Path component(s) for call, if any
    private let pathComponents: [String]
    
    /// Arguments for a Search query, if any
    private let queryParameters: [URLQueryItem]
    
    /// URL constructor to get API request in string format
    private var urlBuilder: String {
        var urlString: String = Constants.baseURL
        urlString += "/"
        urlString += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            urlString += "/"
            let pathString = pathComponents.compactMap({
                return "\($0)"
            }).joined(separator: ",")
            
            urlString += pathString
        }
        
        if !queryParameters.isEmpty {
            urlString += "?"
            let paramString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            urlString += paramString
        }
        
        return urlString
    }
    
    // MARK: - Public properties and methods
    /// Computed API url
    public var url: URL? {
        return URL(string: urlBuilder)
    }
    
    /// Initialize request
    /// - Parameters:
    ///   - endpoint: Required endpoint
    ///   - pathComponents: Collection of any path components
    ///   - queryParameters: Collection of any search query arguments
    public init(endpoint: Endpoint,
                pathComponents: [String] = [],
                queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
}

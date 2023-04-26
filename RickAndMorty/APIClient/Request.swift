//
//  Request.swift
//  RickAndMorty
//
//  Created by Anushree Soman on 4/26/23.
//

import Foundation

class Request {
    private struct Constants {
        static let baseURL = "https://rickandmortyapi.com/api"
    }
    
    private let endpoint: Endpoint
    
    private let pathComponents: [String]
    
    private let queryParameters: [URLQueryItem]
    
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
    
    public var url: URL? {
        return URL(string: urlBuilder)
    }
    
    init(endpoint: Endpoint,
         pathComponents: [String] = [],
         queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
}

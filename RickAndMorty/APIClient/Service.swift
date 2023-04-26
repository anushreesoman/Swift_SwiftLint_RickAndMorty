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
    
    /// Execute service call to Rick and Morty API
    /// - Parameters:
    ///   - request: Request instance
    ///   - completion: Callback with data or error
    public func execute(_ request: Request, completion: @escaping () -> Void) {
        
    }
    
}

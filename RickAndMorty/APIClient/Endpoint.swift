//
//  Endpoint.swift
//  RickAndMorty
//
//  Created by Anushree Soman on 4/26/23.
//

import Foundation

/// Represents unique API endpoints
enum Endpoint: String, Codable {
    /// API endpoint to get character data
    case character
    /// API endpoint to get location data
    case location
    /// API endpoint to get episode data
    case episode
}

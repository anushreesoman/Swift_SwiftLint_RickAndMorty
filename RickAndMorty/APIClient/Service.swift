//
//  Service.swift
//  RickAndMorty
//
//  Created by Anushree Soman on 4/26/23.
//

import Foundation

final class Service {
    static let shared = Service()
    
    private init() {}
    
    public func execute(_ request: Request, completion: @escaping () -> Void) {
        
    }
    
}

//
//  Info.swift
//  RickAndMorty
//
//  Created by Anushree Soman on 4/28/23.
//

import Foundation

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}

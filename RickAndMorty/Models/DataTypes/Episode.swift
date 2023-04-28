//
//  Episode.swift
//  RickAndMorty
//
//  Created by Anushree Soman on 4/20/23.
//

import Foundation

struct Episode: Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}

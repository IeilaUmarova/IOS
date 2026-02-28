//
//  Hero.swift
//  HeroRandomizer
//
//  Created by Leila on 28.02.2026.
//

import Foundation

// MARK: - Hero Model
struct Hero: Codable, Identifiable {
    let id: Int
    let name: String
    let powerstats: Powerstats
    let appearance: Appearance
    let biography: Biography
    let work: Work
    let connections: Connections
    let images: Images
}

// MARK: - Powerstats
struct Powerstats: Codable {
    let intelligence: Int
    let strength: Int
    let speed: Int
    let durability: Int
    let power: Int
    let combat: Int
}

// MARK: - Appearance
struct Appearance: Codable {
    let gender: String?
    let race: String?
    let height: [String]?
    let weight: [String]?
    let eyeColor: String?
    let hairColor: String?
    
    enum CodingKeys: String, CodingKey {
        case gender, race, height, weight
        case eyeColor = "eyeColor"
        case hairColor = "hairColor"
    }
}

// MARK: - Biography
struct Biography: Codable {
    let fullName: String?
    let publisher: String?
    let alignment: String?
    let placeOfBirth: String?
    
    enum CodingKeys: String, CodingKey {
        case fullName = "fullName"
        case publisher, alignment
        case placeOfBirth = "placeOfBirth"
    }
}

// MARK: - Work
struct Work: Codable {
    let occupation: String?
    let base: String?
}

// MARK: - Connections
struct Connections: Codable {
    let groupAffiliation: String?
    let relatives: String?
    
    enum CodingKeys: String, CodingKey {
        case groupAffiliation = "groupAffiliation"
        case relatives
    }
}

// MARK: - Images
struct Images: Codable {
    let lg: String
}

//
//  Models.swift
//  SuperheroRandomizerApp2
//
//  Created by Leila on 02.12.2025.
//

import Foundation

// Модель минимально необходимая для задания
struct Hero: Codable {
    let id: Int
    let name: String
    let powerstats: Powerstats
    let appearance: Appearance
    let biography: Biography
    let images: Images
}

struct Powerstats: Codable {
    let intelligence: Int?
    let strength: Int?
    let speed: Int?
    let durability: Int?
    let power: Int?
    let combat: Int?
}

struct Appearance: Codable {
    let gender: String?
    let race: String?
    let height: [String]?
    let weight: [String]?
    // API иногда использует camelCase; добавим альтернативные ключи
    let eyeColor: String?
    let hairColor: String?

    private enum CodingKeys: String, CodingKey {
        case gender, race, height, weight
        case eyeColor, hairColor
    }
}

struct Biography: Codable {
    let fullName: String?
    let placeOfBirth: String?
    let firstAppearance: String?
    let publisher: String?
    let alignment: String?

    private enum CodingKeys: String, CodingKey {
        case fullName, placeOfBirth, firstAppearance, publisher, alignment
    }
}

struct Images: Codable {
    let xs: String?
    let sm: String?
    let md: String?
    let lg: String?
}

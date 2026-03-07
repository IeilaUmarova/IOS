//
//  Album.swift
//  MusicApp
//
//  Created by Leila on 07.03.2026.
//

import Foundation

struct Album: Identifiable, Codable {
    let id: Int
    let title: String
    let artist: String
    let artworkUrl: String
    let trackCount: Int
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case id = "collectionId"
        case title = "collectionName"
        case artist = "artistName"
        case artworkUrl = "artworkUrl100"
        case trackCount
        case releaseDate
    }
    
    // Для локальных данных
    static var mockAlbums: [Album] {
        [
            Album(id: 1, title: "Abbey Road", artist: "The Beatles", artworkUrl: "https://via.placeholder.com/100", trackCount: 17, releaseDate: "1969"),
            Album(id: 2, title: "Dark Side of the Moon", artist: "Pink Floyd", artworkUrl: "https://via.placeholder.com/100", trackCount: 10, releaseDate: "1973"),
            Album(id: 3, title: "Thriller", artist: "Michael Jackson", artworkUrl: "https://via.placeholder.com/100", trackCount: 9, releaseDate: "1982"),
            Album(id: 4, title: "Back in Black", artist: "AC/DC", artworkUrl: "https://via.placeholder.com/100", trackCount: 10, releaseDate: "1980"),
            Album(id: 5, title: "The Bodyguard", artist: "Whitney Houston", artworkUrl: "https://via.placeholder.com/100", trackCount: 12, releaseDate: "1992")
        ]
    }
}

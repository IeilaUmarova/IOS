//
//  Track.swift
//  MusicApp
//
//  Created by Leila on 07.03.2026.
//

import Foundation

struct Track: Identifiable, Codable {
    let id: Int
    let title: String
    let artist: String
    let albumTitle: String
    let trackNumber: Int
    let duration: Int // в миллисекундах
    let previewUrl: String?
    let artworkUrl: String?
    
    var formattedDuration: String {
        let minutes = duration / 60000
        let seconds = (duration % 60000) / 1000
        return String(format: "%d:%02d", minutes, seconds)
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "trackId"
        case title = "trackName"
        case artist = "artistName"
        case albumTitle = "collectionName"
        case trackNumber
        case duration = "trackTimeMillis"
        case previewUrl
        case artworkUrl = "artworkUrl100"
    }
}

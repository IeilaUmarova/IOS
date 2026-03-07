//
//  MusicService.swift
//  MusicApp
//
//  Created by Leila on 07.03.2026.
//

import Foundation
import Combine

enum APIError: Error {
    case invalidURL
    case noData
    case decodingError
}

class MusicService {
    private let baseURL = "https://itunes.apple.com"
    private var cancellables = Set<AnyCancellable>()
    
    // Поиск альбомов
    func searchAlbums(query: String) async throws -> [Album] {
        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "\(baseURL)/search?term=\(encodedQuery)&entity=album&limit=25"
        
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        struct Response: Codable {
            let results: [Album]
        }
        
        do {
            let response = try JSONDecoder().decode(Response.self, from: data)
            return response.results
        } catch {
            print("Decoding error: \(error)")
            throw APIError.decodingError
        }
    }
    
    // Получение треков альбома
    func getTracks(for albumId: Int) async throws -> [Track] {
        let urlString = "\(baseURL)/lookup?id=\(albumId)&entity=song"
        
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        struct Response: Codable {
            let results: [Track]
        }
        
        do {
            let response = try JSONDecoder().decode(Response.self, from: data)
            // Первый результат - это альбом, остальные - треки
            return Array(response.results.dropFirst())
        } catch {
            print("Decoding error: \(error)")
            throw APIError.decodingError
        }
    }
    
    // Для тестирования без API - локальные данные
    func getLocalAlbums() -> [Album] {
        return Album.mockAlbums
    }
    
    func getLocalTracks(for albumId: Int) -> [Track] {
        return [
            Track(id: 1, title: "Come Together", artist: "The Beatles", albumTitle: "Abbey Road", trackNumber: 1, duration: 259946, previewUrl: nil, artworkUrl: nil),
            Track(id: 2, title: "Something", artist: "The Beatles", albumTitle: "Abbey Road", trackNumber: 2, duration: 183000, previewUrl: nil, artworkUrl: nil),
            Track(id: 3, title: "Maxwell's Silver Hammer", artist: "The Beatles", albumTitle: "Abbey Road", trackNumber: 3, duration: 207000, previewUrl: nil, artworkUrl: nil),
            Track(id: 4, title: "Oh! Darling", artist: "The Beatles", albumTitle: "Abbey Road", trackNumber: 4, duration: 206000, previewUrl: nil, artworkUrl: nil),
            Track(id: 5, title: "Octopus's Garden", artist: "The Beatles", albumTitle: "Abbey Road", trackNumber: 5, duration: 171000, previewUrl: nil, artworkUrl: nil)
        ]
    }
}

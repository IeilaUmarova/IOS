//
//  HeroService.swift
//  HeroRandomizer
//
//  Created by Leila on 28.02.2026.
//

import Foundation

// MARK: - Hero Service
class HeroService {
    private let baseURL = "https://akabab.github.io/superhero-api/api"
    
    // Простой способ: получаем случайного героя по ID от 1 до 731
    func fetchRandomHero() async throws -> Hero {
        let randomID = Int.random(in: 1...731)
        return try await fetchHero(by: randomID)
    }
    
    private func fetchHero(by id: Int) async throws -> Hero {
        let urlString = "\(baseURL)/id/\(id).json"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode(Hero.self, from: data)
    }
}

//
//  NetworkManager.swift
//  SuperheroRandomizerApp2
//
//  Created by Leila on 02.12.2025.
//

import Foundation
import UIKit
import Alamofire

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    private let allHeroesURL = "https://akabab.github.io/superhero-api/api/all.json"

    // Кешируем список героев в памяти
    private(set) var heroes: [Hero] = []

    // Fetch all heroes (Alamofire)
    // completion — всегда вызывается на главном потоке
    func fetchAllHeroes(forceReload: Bool = false, completion: @escaping (Result<[Hero], Error>) -> Void) {
        if !forceReload && !heroes.isEmpty {
            DispatchQueue.main.async { completion(.success(self.heroes)) }
            return
        }

        AF.request(allHeroesURL).validate().responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let list = try decoder.decode([Hero].self, from: data)
                    self.heroes = list
                    DispatchQueue.main.async { completion(.success(list)) }
                } catch {
                    DispatchQueue.main.async { completion(.failure(error)) }
                }
            case .failure(let afError):
                DispatchQueue.main.async { completion(.failure(afError)) }
            }
        }
    }

    // Helper: find hero by id (returns optional)
    func hero(by id: Int) -> Hero? {
        return heroes.first(where: { $0.id == id })
    }

    // Helper: random hero
    func randomHero() -> Hero? {
        return heroes.randomElement()
    }
}

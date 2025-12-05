//
//  Persistence.swift
//  SuperheroRandomizerApp2
//
//  Created by Leila on 02.12.2025.
//

import Foundation

enum Persistence {
    private static let lastHeroIDKey = "lastHeroID_v1"

    static func saveLastHeroID(_ id: Int) {
        UserDefaults.standard.set(id, forKey: lastHeroIDKey)
    }

    static func loadLastHeroID() -> Int? {
        let value = UserDefaults.standard.object(forKey: lastHeroIDKey)
        return value as? Int
    }

    static func clearLastHero() {
        UserDefaults.standard.removeObject(forKey: lastHeroIDKey)
    }
}

//
//  HeroViewModel.swift
//  HeroRandomizer
//
//  Created by Leila on 28.02.2026.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class HeroViewModel: ObservableObject {
    @Published var currentHero: Hero?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let heroService = HeroService()
    
    func loadRandomHero() {
        Task {
            isLoading = true
            errorMessage = nil
            
            do {
                currentHero = try await heroService.fetchRandomHero()
            } catch {
                errorMessage = "Не удалось загрузить героя. Проверьте подключение к интернету."
                print("Error: \(error.localizedDescription)")
            }
            
            isLoading = false
        }
    }
}

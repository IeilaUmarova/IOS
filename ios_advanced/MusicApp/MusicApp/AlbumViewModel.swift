//
//  AlbumViewModel.swift
//  MusicApp
//
//  Created by Leila on 07.03.2026.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class AlbumsViewModel: ObservableObject {
    @Published var albums: [Album] = []
    @Published var searchText = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let router: AppRouter
    private let musicService: MusicService
    private var cancellables = Set<AnyCancellable>()
    
    init(router: AppRouter, musicService: MusicService) {
        self.router = router
        self.musicService = musicService
        
        // Наблюдаем за изменениями поискового текста
        $searchText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] text in
                if text.isEmpty {
                    self?.loadLocalAlbums()
                } else {
                    self?.searchAlbums(query: text)
                }
            }
            .store(in: &cancellables)
        
        // Загружаем начальные данные
        loadLocalAlbums()
    }
    
    func loadLocalAlbums() {
        self.albums = musicService.getLocalAlbums()
    }
    
    func searchAlbums(query: String) {
        guard !query.isEmpty else {
            loadLocalAlbums()
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        Task {
            do {
                let results = try await musicService.searchAlbums(query: query)
                self.albums = results
                self.isLoading = false
            } catch {
                self.errorMessage = "Failed to load: \(error.localizedDescription)"
                self.isLoading = false
            }
        }
    }
    
    func didSelectAlbum(_ album: Album) {
        router.showTracks(for: album)
    }
}

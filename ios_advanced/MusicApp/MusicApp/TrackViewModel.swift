//
//  TrackViewModel.swift
//  MusicApp
//
//  Created by Leila on 07.03.2026.
//

import Foundation
import SwiftUI
import Combine

@MainActor
class TracksViewModel: ObservableObject {
    @Published var tracks: [Track] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    let album: Album
    private let router: AppRouter
    private let musicService: MusicService
    
    init(router: AppRouter, musicService: MusicService, album: Album) {
        self.router = router
        self.musicService = musicService
        self.album = album
        
        loadTracks()
    }
    
    func loadTracks() {
        isLoading = true
        
        // Используем локальные данные
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            guard let self = self else { return }
            self.tracks = self.musicService.getLocalTracks(for: self.album.id)
            self.isLoading = false
        }
        
        // Для реального API раскомментировать:
        /*
        Task {
            do {
                let results = try await musicService.getTracks(for: album.id)
                self.tracks = results
                self.isLoading = false
            } catch {
                self.errorMessage = "Failed to load tracks"
                self.isLoading = false
            }
        }
        */
    }
    
    func didSelectTrack(_ track: Track) {
        router.showPlayer(for: track, album: album)
    }
}

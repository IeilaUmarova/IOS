//
//  PlayerViewModel.swift
//  MusicApp
//
//  Created by Leila on 07.03.2026.
//

import Foundation
import SwiftUI
import AVKit
import Combine

@MainActor
class PlayerViewModel: ObservableObject {
    @Published var isPlaying = false
    @Published var currentTime: Double = 0
    @Published var duration: Double = 0
    
    let track: Track
    let album: Album
    private let router: AppRouter
    
    // Для аудио (бонус)
    private var player: AVPlayer?
    private var timeObserver: Any?
    
    init(router: AppRouter, track: Track, album: Album) {
        self.router = router
        self.track = track
        self.album = album
        self.duration = Double(track.duration) / 1000
        
        setupAudio()
    }
    
    private func setupAudio() {
        guard let previewUrl = track.previewUrl, let url = URL(string: previewUrl) else {
            return
        }
        
        player = AVPlayer(url: url)
        
        // Добавляем наблюдатель за временем
        timeObserver = player?.addPeriodicTimeObserver(forInterval: CMTime(seconds: 0.1, preferredTimescale: 600), queue: .main) { [weak self] time in
            self?.currentTime = time.seconds
        }
    }
    
    func togglePlayback() {
        if isPlaying {
            player?.pause()
        } else {
            player?.play()
        }
        isPlaying.toggle()
    }
    
    func seekTo(_ time: Double) {
        let cmTime = CMTime(seconds: time, preferredTimescale: 600)
        player?.seek(to: cmTime)
    }
    
    func goBack() {
        // Очищаем ресурсы
        if let timeObserver = timeObserver {
            player?.removeTimeObserver(timeObserver)
        }
        player?.pause()
        player = nil
        
        router.goBack()
    }
    
    deinit {
        if let timeObserver = timeObserver {
            player?.removeTimeObserver(timeObserver)
        }
    }
}

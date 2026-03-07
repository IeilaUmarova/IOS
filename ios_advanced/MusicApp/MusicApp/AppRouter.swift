//
//  AppRouter.swift
//  MusicApp
//
//  Created by Leila on 07.03.2026.
//

import UIKit
import SwiftUI

class AppRouter {
    let navigationController: UINavigationController
    private let musicService = MusicService()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // Стартовый экран - Albums
    func start() {
        let viewModel = AlbumsViewModel(router: self, musicService: musicService)
        let albumsView = AlbumsView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: albumsView)
        hostingController.title = "Albums"
        navigationController.setViewControllers([hostingController], animated: false)
    }
    
    // Показать список треков для выбранного альбома
    func showTracks(for album: Album) {
        let viewModel = TracksViewModel(router: self, musicService: musicService, album: album)
        let tracksView = TracksView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: tracksView)
        hostingController.title = album.title
        navigationController.pushViewController(hostingController, animated: true)
    }
    
    // Показать плеер для выбранного трека
    func showPlayer(for track: Track, album: Album) {
        let viewModel = PlayerViewModel(router: self, track: track, album: album)
        let playerView = PlayerView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: playerView)
        hostingController.title = "Now Playing"
        navigationController.pushViewController(hostingController, animated: true)
    }
    
    // Назад
    func goBack() {
        navigationController.popViewController(animated: true)
    }
    
    // Назад к корню
    func goToRoot() {
        navigationController.popToRootViewController(animated: true)
    }
}

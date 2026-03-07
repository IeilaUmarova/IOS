//
//  PlayerView.swift
//  MusicApp
//
//  Created by Leila on 07.03.2026.
//

import SwiftUI

struct PlayerView: View {
    @ObservedObject var viewModel: PlayerViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 30) {
            // Кнопка назад
            HStack {
                Button(action: {
                    viewModel.goBack()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                }
                Spacer()
            }
            .padding(.horizontal)
            
            Spacer()
            
            // Большая обложка
            AsyncImage(url: URL(string: viewModel.album.artworkUrl.replacingOccurrences(of: "100x100", with: "600x600"))) { phase in
                switch phase {
                case .empty:
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 300, height: 300)
                        .overlay(ProgressView())
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                case .failure:
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 300, height: 300)
                        .overlay(
                            Image(systemName: "music.note")
                                .font(.system(size: 60))
                                .foregroundColor(.gray)
                        )
                @unknown default:
                    EmptyView()
                }
            }
            
            // Информация о треке
            VStack(spacing: 8) {
                Text(viewModel.track.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text(viewModel.track.artist)
                    .font(.title2)
                    .foregroundColor(.secondary)
                
                Text(viewModel.album.title)
                    .font(.headline)
                    .foregroundColor(.secondary)
            }
            
            // Прогресс бар (статический или с бонусной функциональностью)
            VStack(spacing: 8) {
                Slider(value: $viewModel.currentTime, in: 0...viewModel.duration, onEditingChanged: { editing in
                    if !editing {
                        viewModel.seekTo(viewModel.currentTime)
                    }
                })
                .accentColor(.blue)
                
                HStack {
                    Text(formatTime(viewModel.currentTime))
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Text(formatTime(viewModel.duration))
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.horizontal, 40)
            
            // Кнопки управления
            HStack(spacing: 40) {
                Button(action: {}) {
                    Image(systemName: "backward.fill")
                        .font(.title)
                }
                .foregroundColor(.secondary)
                
                Button(action: {
                    viewModel.togglePlayback()
                }) {
                    Image(systemName: viewModel.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                        .font(.system(size: 70))
                        .foregroundColor(.blue)
                }
                
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                        .font(.title)
                }
                .foregroundColor(.secondary)
            }
            .padding(.vertical, 20)
            
            Spacer()
        }
        .navigationBarHidden(true)
    }
    
    private func formatTime(_ time: Double) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}

#Preview {
    let router = AppRouter(navigationController: UINavigationController())
    let album = Album.mockAlbums[0]
    let track = Track(id: 1, title: "Come Together", artist: "The Beatles", albumTitle: "Abbey Road", trackNumber: 1, duration: 259946, previewUrl: nil, artworkUrl: nil)
    let viewModel = PlayerViewModel(router: router, track: track, album: album)
    return PlayerView(viewModel: viewModel)
}

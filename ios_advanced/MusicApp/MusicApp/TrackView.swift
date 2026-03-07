//
//  TracksView.swift
//  MusicApp
//
//  Created by Leila on 07.03.2026.
//

import SwiftUI

struct TracksView: View {
    @ObservedObject var viewModel: TracksViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 0) {
            // Хедер альбома
            AlbumHeaderView(album: viewModel.album)
            
            if viewModel.isLoading {
                Spacer()
                ProgressView()
                Spacer()
            } else {
                // Список треков
                List(viewModel.tracks) { track in
                    TrackRow(track: track)
                        .onTapGesture {
                            viewModel.didSelectTrack(track)
                        }
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                }
            }
        }
    }
}

struct AlbumHeaderView: View {
    let album: Album
    
    var body: some View {
        VStack(spacing: 12) {
            // Большая обложка
            AsyncImage(url: URL(string: album.artworkUrl.replacingOccurrences(of: "100x100", with: "600x600"))) { phase in
                switch phase {
                case .empty:
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 200, height: 200)
                        .overlay(ProgressView())
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        .cornerRadius(12)
                case .failure:
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 200, height: 200)
                        .overlay(
                            Image(systemName: "music.note")
                                .font(.largeTitle)
                                .foregroundColor(.gray)
                        )
                @unknown default:
                    EmptyView()
                }
            }
            
            VStack(spacing: 4) {
                Text(album.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text(album.artist)
                    .font(.title3)
                    .foregroundColor(.secondary)
                
                HStack {
                    // ИСПРАВЛЕНО: убрал if let,直接用 String(album.releaseDate.prefix(4))
                    let year = String(album.releaseDate.prefix(4))
                    Text("Released: \(year)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    Text("•")
                        .foregroundColor(.secondary)
                    
                    Text("\(album.trackCount) tracks")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

struct TrackRow: View {
    let track: Track
    
    var body: some View {
        HStack {
            // Номер трека
            Text("\(track.trackNumber)")
                .font(.headline)
                .foregroundColor(.secondary)
                .frame(width: 30, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(track.title)
                    .font(.body)
                    .lineLimit(1)
                
                Text(track.artist)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
            
            Spacer()
            
            // Длительность
            Text(track.formattedDuration)
                .font(.caption)
                .foregroundColor(.secondary)
                .padding(.horizontal, 8)
            
            Image(systemName: "play.circle")
                .foregroundColor(.blue)
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    let router = AppRouter(navigationController: UINavigationController())
    let service = MusicService()
    let album = Album.mockAlbums[0]
    let viewModel = TracksViewModel(router: router, musicService: service, album: album)
    return TracksView(viewModel: viewModel)
}

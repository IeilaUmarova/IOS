//
//  AlbumView.swift
//  MusicApp
//
//  Created by Leila on 07.03.2026.
//

import SwiftUI

struct AlbumsView: View {
    @ObservedObject var viewModel: AlbumsViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                // Поисковая строка
                SearchBar(text: $viewModel.searchText)
                
                if viewModel.isLoading {
                    ProgressView()
                        .scaleEffect(1.5)
                        .padding()
                } else if let error = viewModel.errorMessage {
                    VStack {
                        Image(systemName: "exclamationmark.triangle")
                            .font(.largeTitle)
                            .foregroundColor(.orange)
                        Text(error)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                } else {
                    // Список альбомов
                    List(viewModel.albums) { album in
                        AlbumRow(album: album)
                            .onTapGesture {
                                viewModel.didSelectAlbum(album)
                            }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Albums")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AlbumRow: View {
    let album: Album
    
    var body: some View {
        HStack {
            // Обложка
            AsyncImage(url: URL(string: album.artworkUrl)) { phase in
                switch phase {
                case .empty:
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 60, height: 60)
                        .overlay(
                            ProgressView()
                        )
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .cornerRadius(8)
                case .failure:
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 60, height: 60)
                        .overlay(
                            Image(systemName: "music.note")
                                .foregroundColor(.gray)
                        )
                @unknown default:
                    EmptyView()
                }
            }
            
            // Информация
            VStack(alignment: .leading, spacing: 4) {
                Text(album.title)
                    .font(.headline)
                    .lineLimit(1)
                
                Text(album.artist)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                
                HStack {
                    Text("\(album.trackCount) tracks")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    // Исправленная часть
                    let year = String(album.releaseDate.prefix(4))
                    Text("• \(year)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.leading, 4)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 4)
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            
            TextField("Search albums...", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
            
            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

#Preview {
    let router = AppRouter(navigationController: UINavigationController())
    let service = MusicService()
    let viewModel = AlbumsViewModel(router: router, musicService: service)
    AlbumsView(viewModel: viewModel)
}

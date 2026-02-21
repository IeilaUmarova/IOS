//
//  ContentView.swift
//  MyFavoritesList
//
//  Created by Leila on 21.02.2026.
//

import SwiftUI

// MARK: - Data Model
struct FavoriteItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let emoji: String
    var isFavorite: Bool = false
}

// MARK: - Main Content View
struct ContentView: View {
    
    @State private var englishMusic: [FavoriteItem] = [
        FavoriteItem(title: "Hometown Smile", subtitle: "Bahjat", emoji: "❤️‍🔥"),
        FavoriteItem(title: "Lost on You", subtitle: "LP", emoji: "❤️‍🔥"),
        FavoriteItem(title: "Amazing", subtitle: "INNA", emoji: "❤️‍🔥"),
        FavoriteItem(title: "Aicha", subtitle: "Outlandish", emoji: "❤️‍🔥"),
        FavoriteItem(title: "Callin' U", subtitle: "Outlandish", emoji: "❤️‍🔥"),
        FavoriteItem(title: "I lost You", subtitle: "Havan", emoji: "❤️‍🔥"),
        FavoriteItem(title: "Sorry Seems to be the Hardest One", subtitle: "Blue", emoji: "❤️‍🔥"),
        FavoriteItem(title: "No Face, No Name, No Number", subtitle: "Modern Talking", emoji: "❤️‍🔥"),
        FavoriteItem(title: "Dov'e L'amore", subtitle: "Cher", emoji: "❤️‍🔥"),
        FavoriteItem(title: "When I Dream at Night", subtitle: "Marc Anthony", emoji: "❤️‍🔥")
    ]
    
    @State private var russianMusic: [FavoriteItem] = [
        FavoriteItem(title: "Душа моей души", subtitle: "Adam", emoji: "🤍"),
        FavoriteItem(title: "Иса", subtitle: "ANDRO", emoji: "🤍"),
        FavoriteItem(title: "Лейла", subtitle: "Jah Khalib", emoji: "🤍"),
        FavoriteItem(title: "Мой мир замер", subtitle: "TARA202", emoji: "🤍"),
        FavoriteItem(title: "Позави", subtitle: "EDGAR", emoji: "🤍"),
        FavoriteItem(title: "По пятам", subtitle: "AlZaBi", emoji: "🤍"),
        FavoriteItem(title: "С неба", subtitle: "ELMAN, TRIDA", emoji: "🤍"),
        FavoriteItem(title: "Love is", subtitle: "MrLambo", emoji: "🤍"),
        FavoriteItem(title: "Малефисиента", subtitle: "Khalif, Rruslan", emoji: "🤍"),
        FavoriteItem(title: "Улетай", subtitle: "Strange", emoji: "🤍")
    ]
    
    @State private var arabianMusic: [FavoriteItem] = [
        FavoriteItem(title: "180 Darga", subtitle: "Tamer Hosny", emoji: "🖤"),
        FavoriteItem(title: "Batmanna Ansak", subtitle: "Shahlo Azimova", emoji: "🖤"),
        FavoriteItem(title: "Inty Eyh", subtitle: "Nancy Ajram", emoji: "🖤"),
        FavoriteItem(title: "Amaraine", subtitle: "Amr Diab", emoji: "🖤"),
        FavoriteItem(title: "Qusad Einy", subtitle: "Amr Diab", emoji: "🖤"),
        FavoriteItem(title: "Tamally Maak", subtitle: "Amr Diab", emoji: "🖤"),
        FavoriteItem(title: "Nour El Ein", subtitle: "Amr Diab", emoji: "🖤"),
        FavoriteItem(title: "Why", subtitle: "Antique", emoji: "🖤"),
        FavoriteItem(title: "Aicha", subtitle: "Khaled", emoji: "🖤"),
        FavoriteItem(title: "Alabina", subtitle: "Alabina", emoji: "🖤")
    ]
    
    @State private var kazakhMusic: [FavoriteItem] = [
        FavoriteItem(title: "Suluym", subtitle: "Aikyn Tolepbergen", emoji: "💕"),
        FavoriteItem(title: "Келемін саған", subtitle: "Алишер Каримов", emoji: "💕"),
        FavoriteItem(title: "Мазаламайын", subtitle: "Kanat Umbetov", emoji: "💕"),
        FavoriteItem(title: "Tek sende", subtitle: "akimmmich", emoji: "💕"),
        FavoriteItem(title: "Тау-тау сезім", subtitle: "Беркут", emoji: "💕"),
        FavoriteItem(title: "Аяла", subtitle: "Жанабай Отегенов", emoji: "💕"),
        FavoriteItem(title: "Сен үшін жаралғандаймын", subtitle: "Meirambek Besbayev", emoji: "💕"),
        FavoriteItem(title: "Махаббат", subtitle: "Әбдіжаппар Әлқожа", emoji: "💕"),
        FavoriteItem(title: "Ainalaiyn", subtitle: "Nurzhan Kermenbayev", emoji: "💕"),
        FavoriteItem(title: "Тағыда", subtitle: "Алишер Каримов", emoji: "💕")
    ]
    
    private var totalItems: Int {
        englishMusic.count + russianMusic.count + arabianMusic.count + kazakhMusic.count
    }
    
    // MARK: - Helper Functions
    private func toggleFavorite(for item: FavoriteItem, in section: String) {
        switch section {
        case "English Music":
            if let index = englishMusic.firstIndex(where: { $0.id == item.id }) {
                englishMusic[index].isFavorite.toggle()
            }
        case "Russian Music":
            if let index = russianMusic.firstIndex(where: { $0.id == item.id }) {
                russianMusic[index].isFavorite.toggle()
            }
        case "Arabic Music":
            if let index = arabianMusic.firstIndex(where: { $0.id == item.id }) {
                arabianMusic[index].isFavorite.toggle()
            }
        case "Kazakh Music":
            if let index = kazakhMusic.firstIndex(where: { $0.id == item.id }) {
                kazakhMusic[index].isFavorite.toggle()
            }
        default:
            break
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16, pinnedViews: [.sectionHeaders]) {
                    // English Music Section
                    Section(header: sectionHeader(title: "English Music", emoji: "🇺🇸", color: .blue)) {
                        ForEach(englishMusic) { item in
                            MusicRow(item: item, section: "English Music") { favoriteItem in
                                toggleFavorite(for: favoriteItem, in: "English Music")
                            }
                        }
                    }
                    
                    // Russian Music Section
                    Section(header: sectionHeader(title: "Russian Music", emoji: "🇷🇺", color: .red)) {
                        ForEach(russianMusic) { item in
                            MusicRow(item: item, section: "Russian Music") { favoriteItem in
                                toggleFavorite(for: favoriteItem, in: "Russian Music")
                            }
                        }
                    }
                    
                    // Arabic Music Section
                    Section(header: sectionHeader(title: "Arabic Music", emoji: "🇦🇪", color: .green)) {
                        ForEach(arabianMusic) { item in
                            MusicRow(item: item, section: "Arabic Music") { favoriteItem in
                                toggleFavorite(for: favoriteItem, in: "Arabic Music")
                            }
                        }
                    }
                    
                    // Kazakh Music Section
                    Section(header: sectionHeader(title: "Kazakh Music", emoji: "🇰🇿", color: .orange)) {
                        ForEach(kazakhMusic) { item in
                            MusicRow(item: item, section: "Kazakh Music") { favoriteItem in
                                toggleFavorite(for: favoriteItem, in: "Kazakh Music")
                            }
                        }
                    }
                    
                    // Item Counter
                    HStack {
                        Spacer()
                        Text("Total Items: \(totalItems)")
                            .font(.headline)
                            .foregroundColor(.secondary)
                            .padding()
                        Spacer()
                    }
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .padding(.top, 20)
                }
                .padding(.horizontal)
            }
            .navigationTitle("My Favorite Music")
            .background(Color(.systemGroupedBackground))
        }
    }
    
    // MARK: - Custom Section Header
    private func sectionHeader(title: String, emoji: String, color: Color) -> some View {
        HStack {
            Text("\(emoji) \(title)")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(color)
            Spacer()
            Text("10 items")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color(.systemGray5))
                .cornerRadius(8)
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(.systemBackground))
                .shadow(color: color.opacity(0.3), radius: 3, x: 0, y: 2)
        )
        .padding(.top, 8)
    }
}

// MARK: - Music Row Subview
struct MusicRow: View {
    let item: FavoriteItem
    let section: String
    let onFavoriteToggle: (FavoriteItem) -> Void
    
    var body: some View {
        HStack(spacing: 12) {
            Text(item.emoji)
                .font(.title)
                .frame(width: 50, height: 50)
                .background(
                    Circle()
                        .fill(Color(.systemGray6))
                        .shadow(color: .gray.opacity(0.3), radius: 2, x: 0, y: 1)
                )
            
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Text(item.subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Button(action: {
                onFavoriteToggle(item)
            }) {
                Image(systemName: item.isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(item.isFavorite ? .red : .gray)
                    .font(.title3)
                    .frame(width: 44, height: 44)
                    .background(
                        Circle()
                            .fill(Color(.systemGray6))
                            .opacity(0.5)
                    )
            }
            .buttonStyle(BorderlessButtonStyle())
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: .gray.opacity(0.2), radius: 3, x: 0, y: 2)
        )
        .padding(.horizontal, 4)
        .padding(.vertical, 4)
    }
}

#Preview {
    ContentView()
}

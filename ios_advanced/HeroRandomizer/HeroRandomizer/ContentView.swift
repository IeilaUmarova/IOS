//
//  ContentView.swift
//  HeroRandomizer
//
//  Created by Leila on 28.02.2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = HeroViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(spacing: 20) {
                        if viewModel.isLoading {
                            ProgressView("Загрузка героя...")
                                .scaleEffect(1.5)
                                .padding(.top, 50)
                        } else if let hero = viewModel.currentHero {
                            HeroCardView(hero: hero)
                        } else {
                            EmptyStateView()
                        }
                        
                        RandomizeButton(action: viewModel.loadRandomHero)
                            .padding(.bottom, 20)
                    }
                    .padding()
                }
            }
            .navigationTitle("HeroRandomizer")
            .navigationBarTitleDisplayMode(.inline)
            .alert("Ошибка", isPresented: .constant(viewModel.errorMessage != nil)) {
                Button("OK") {
                    viewModel.errorMessage = nil
                }
            } message: {
                Text(viewModel.errorMessage ?? "")
            }
        }
    }
}

// MARK: - Hero Card View
struct HeroCardView: View {
    let hero: Hero
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            // Hero Image
            AsyncImage(url: URL(string: hero.images.lg)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(height: 250)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxHeight: 300)
                        .cornerRadius(15)
                case .failure:
                    Image(systemName: "photo.fill")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                        .frame(height: 250)
                @unknown default:
                    EmptyView()
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(15)
            
            // Hero Name
            Text(hero.name)
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .center)
            
            // Attributes Sections
            VStack(alignment: .leading, spacing: 20) {
                // Powerstats Section
                AttributeSection(title: "Сила") {
                    PowerStatsView(powerstats: hero.powerstats)
                }
                
                // Biography Section
                if hero.biography.fullName != nil || hero.biography.publisher != nil {
                    AttributeSection(title: "Биография") {
                        InfoRow(label: "Полное имя", value: hero.biography.fullName ?? "Неизвестно")
                        InfoRow(label: "Издатель", value: hero.biography.publisher ?? "Неизвестно")
                    }
                }
                
                // Appearance Section
                AttributeSection(title: "Внешность") {
                    InfoRow(label: "Пол", value: hero.appearance.gender ?? "Неизвестно")
                    InfoRow(label: "Раса", value: hero.appearance.race ?? "Неизвестно")
                    InfoRow(label: "Рост", value: hero.appearance.height?.last ?? "Неизвестно")
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 5)
    }
}

// MARK: - PowerStats View
struct PowerStatsView: View {
    let powerstats: Powerstats
    
    var body: some View {
        VStack(spacing: 10) {
            StatBar(name: "Интеллект", value: powerstats.intelligence, color: .green)
            StatBar(name: "Сила", value: powerstats.strength, color: .green)
            StatBar(name: "Скорость", value: powerstats.speed, color: .green)
            StatBar(name: "Выносливость", value: powerstats.durability, color: .green)
            StatBar(name: "Энергия", value: powerstats.power, color: .green)
        }
    }
}

struct StatBar: View {
    let name: String
    let value: Int
    let color: Color
    
    var body: some View {
        HStack {
            Text(name)
                .frame(width: 100, alignment: .leading)
                .font(.system(size: 14, weight: .medium))
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: geometry.size.width, height: 10)
                        .opacity(0.3)
                        .foregroundColor(color.opacity(0.3))
                    
                    Rectangle()
                        .frame(width: min(CGFloat(value) / 100 * geometry.size.width, geometry.size.width), height: 10)
                        .foregroundColor(color)
                }
                .cornerRadius(5)
            }
            .frame(height: 10)
            
            Text("\(value)")
                .frame(width: 40, alignment: .trailing)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(color)
        }
    }
}

// MARK: - Info Row
struct InfoRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label + ":")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.secondary)
            Text(value)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(.primary)
            Spacer()
        }
    }
}

// MARK: - Attribute Section
struct AttributeSection<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundColor(.black)
            
            content
                .padding(.leading, 5)
            
            Divider()
        }
    }
}

// MARK: - Randomize Button
struct RandomizeButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text("Случайный герой")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(.black)
            .foregroundColor(.white)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        }
    }
}

// MARK: - Empty State View
struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.fill.questionmark")
                .font(.system(size: 60))
                .foregroundColor(.black)
        }
        .padding(.vertical, 50)
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  FavoriteDishes
//
//  Created by Leila on 12.02.2026.
//

import SwiftUI

struct DishesItem {
    let image: String
    let desc: String
    let taste: String
}

struct ContentView: View {
    @State private var currentItem: DishesItem
    @State private var tapCount = 0
    
    let dishes = [
        DishesItem(image: "croissant", desc: "🥐 French croissant, crispy and layered (especially with chocolate)", taste: "Taste: ⭐️⭐️⭐️⭐️⭐️"),
        DishesItem(image: "chocolateCookies", desc: "🍪 Chocolate chip cookies with pieces of chocolate", taste: "Taste: ⭐️⭐️⭐️⭐️⭐️"),
        DishesItem(image: "pizza", desc: "🍕 Italian pizza with stretched cheese", taste: "Taste: ⭐️⭐️⭐️⭐️⭐️"),
        DishesItem(image: "strawberry", desc: "🍓 Fresh strawberries, sweet and juicy", taste: "Taste: ⭐️⭐️⭐️⭐️⭐️"),
        DishesItem(image: "watermelon", desc: "🍉 Ripe watermelon, refreshing and sweet (especially cold one)", taste: "Taste: ⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️"),
        DishesItem(image: "balanyez", desc: "🍝 Pasta Bolognese with meat sauce and parmesan", taste: "Taste: ⭐️⭐️⭐️⭐️⭐️"),
        DishesItem(image: "plov", desc: "🍚 Uzbek pilaf with mutton and carrots", taste: "Taste: ⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️"),
        DishesItem(image: "sushi", desc: "🍱 Fried, crispy sushi", taste: "Taste: ⭐️⭐️⭐️⭐️⭐️")
    ]
    
    init() {
        _currentItem = State(initialValue: dishes[0])
    }
    
    var body: some View {
        VStack {
            Text("🌶️ Favorite Dishes")
                .font(.custom("Avenir-Black", size: 36))
                .foregroundColor(.black)
                .padding(.top, 50)
            
            Image(currentItem.image)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                
            VStack{
                Text(currentItem.desc)
                    .font(.custom("Avenir-Black", size: 20))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 50)
                    .lineLimit(nil)
            }
            .frame(height: 120)
            
            Text(currentItem.taste)
                .font(.custom("Avenir-Black", size: 20))
                .foregroundColor(.black)
                .padding(.horizontal, 50)
                .frame(height: 80)
                .padding(.top, -40)

            Button(action: {
                withAnimation(.spring()) {
                    currentItem = dishes.randomElement() ?? dishes[0]
                    tapCount += 1
                }
            }) {
                Text("🎲 Surprise me!")
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }
            .padding()
            
            Text("Cards explored: \(tapCount)")
                .font(.custom("Avenir-Black", size: 20))
                .foregroundColor(.gray)
                .padding(.horizontal, 50)
                .frame(height: 30)
        }
    }
}

#Preview {
    ContentView()
}

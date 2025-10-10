//
//  Product.swift
//  
//
//  Created by Leila on 10.10.2025.
//
import Foundation

struct Product {
    var id: Int
    var name: String
    var price: Double
    var category: Category
    var description: String
    
    enum Category: String, CaseIterable {
        case electronics
        case clothing
        case food
        case books
    }
    
    var displayPrice: String {
        return String(format: "$%.2f", price)
    }
    
    init?(id: Int, name: String, price:Double, category: Category, description: String){
        guard price > 0 else{
            print("Error: price must be positive")
            return nil
        }
        self.id = id
        self.name = name
        self.price = price
        self.category = category
        self.description = description
    }
}




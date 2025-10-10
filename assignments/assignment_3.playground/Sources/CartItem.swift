//
//  CartItem.swift
//  
//
//  Created by Leila on 10.10.2025.
//

struct CartItem {
    var product: Product
    var quantity: Int
    
    var subtotal: Double {
        return product.price * Double(quantity)
    }
    
    init?(product: Product, quantity: Int) {
        guard quantity > 0 else{
            print("Error: quantity must be positive")
            return nil
        }
        self.product = product
        self.quantity = quantity
    }
    
    mutating func updateQuantity(_ newQuantity: Int) {
        if newQuantity > 0 {
            quantity = newQuantity
        }
        else{
            print("Error: quantity must be positive")
        }
    }
    
    mutating func increaseQuantity(by amount: Int) {
        if amount > 0 {
            quantity += amount
        }
        else {
            print("Error: quantity must be positive")
        }
    }
    
}





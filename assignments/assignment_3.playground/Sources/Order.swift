//
//  Order.swift
//  
//
//  Created by Leila on 10.10.2025.
//
import Foundation

struct Order {
    var orderId: String
    var items: [CartItem]
    var subtotal: Double
    var discountAmount: Double
    var total: Double
    var timestamp: Date
    var shippingAddress: Address
    
    init(from cart: ShoppingCart, shippingAddress: Address) {
        self.orderId = UUID().uuidString
        self.items = cart.items
        self.subtotal = cart.subtotal
        self.discountAmount = cart.discountAmount
        self.total = cart.total
        self.timestamp = Date()
        self.shippingAddress = shippingAddress
    }
    
    var itemCount: Int{
        items.reduce(0) { $0 + $1.quantity }
    }
}




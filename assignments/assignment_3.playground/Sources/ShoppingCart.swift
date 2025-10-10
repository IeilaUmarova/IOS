//
//  ShoppingCart.swift
//  
//
//  Created by Leila on 10.10.2025.
//

class ShoppingCart {
    private(set) var items: [CartItem] = []
    var discountCode: String?
    
    init() {
        self.items = []
        self.discountCode = nil
    }
    
    func addItem(product: Product, quantity: Int = 1) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].increaseQuantity(by: quantity)
        }
        else{
            if let newItem = CartItem(product: product, quantity: quantity) {
                items.append(newItem)
            }
        }
    }
    
    func removeItem(productId: Int) {
        items.removeAll { $0.product.id == productId}
    }
    
    func updateItemQuantity(productId: Int, quantity: Int) {
        if let index = items.firstIndex(where: { $0.product.id == productId}){
            if quantity == 0 {
                removeItem(productId: productId)
            }
            else {
                items[index].updateQuantity(quantity)
            }
        }
    }
    
    func clearAllItems() {
        items.removeAll()
    }
    
    var subtotal: Double {
        items.reduce(0) { $0 + $1.subtotal}
    }
    
    var discountAmount: Double {
        guard let code = discountCode else { return 0 }
        switch code {
        case "SAVE10": return subtotal * 0.1
        case "SAVE20": return subtotal * 0.2
        default: return 0
        }
    }
    
    var total: Double {
        subtotal - discountAmount
    }
    
    var itemCount: Int {
        items.reduce(0) { $0 + $1.quantity}
    }
    
    var isEmpty: Bool {
        items.isEmpty
    }
}




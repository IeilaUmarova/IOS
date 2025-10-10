//
//  Tests.swift
//  
//
//  Created by Leila on 10.10.2025.
//

func main() {
    let laptop = Product(id: 1, name: "MacBook", price: 1200.0, category: .electronics, description: "Apple laptop")!
    let book = Product(id: 2, name: "Cooking Book", price: 30.0, category: .books, description: "Learn how to cook")!
    let headphones = Product(id: 3, name: "Headphones", price: 100.0, category: .electronics, description: "Noise cancelling")!
    
    let cart = ShoppingCart()
    cart.addItem(product: laptop, quantity: 1)
    cart.addItem(product: book, quantity: 2)
    cart.addItem(product: headphones, quantity: 3)
    
    cart.addItem(product: laptop, quantity: 1)
    
    print("Subtotal: \(cart.subtotal)")
    print("ItemCount: \(cart.itemCount)")
    
    cart.discountCode = "SAVE10"
    print("Total with discount: \(cart.total)")
    
    cart.removeItem(productId: 2)
    
    func modifyCart(_ cart: ShoppingCart) {
        cart.addItem(product: headphones, quantity: 1)
    }
    modifyCart(cart)
    print("Cart item count after modify: \(cart.itemCount)")
    
    let item1 = CartItem(product: laptop, quantity: 1)!
    var item2 = item1
    item2.updateQuantity(5)
    print("Item1 quantity: \(item1.quantity), Item2 quantity: \(item2.quantity)")
    
    let address = Address(street: "Main St 12", city: "Almaty", zipcode: "050000", country: "Kazakhstan")
    let order = Order(from: cart, shippingAddress: address)
    
    cart.clearAllItems()
    print("Order items count: \(order.itemCount)")
    print("Cart items count: \(cart.itemCount)")
}




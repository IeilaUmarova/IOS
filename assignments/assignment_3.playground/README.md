SOPPING CART

1) Project Description
This is a simple online store model implemented on Swift, where there are three main types of data:
Product — product description
CartItem — basket element (product + quantity)
ShoppingCart is the shopping cart itself, which manages adding and counting items.
The project shows how to use structs and classes,as well as how value types and referenc types work in Swift.

2) Why did you choose class for ShoppingCart?
I chose the class for ShoppingCart because the shopping cart should be one common object that can be modified from different places in the program.
If the user adds an item to the cart through one screen, the changes should be immediately displayed on the other.
In Swift, classes are reference types, meaning that when passing a bucket variable, not a copy is created, but a reference to the same object.
This makes the behavior more realistic: one bucket means one state for the entire user.

3) Why did you choose struct for Product and Order?
I chose struct for Product and Order because they describe data, not behavior.
They don't need to have an “identity” — all that matters is their meaning.
A product is just a product description (name, price, category, etc.)
An Order is a “snapshot” of the shopping cart at the time of ordering. After creation, the order must be unchanged.
In Swift, structures are value types, so when copying, a new independent copy is created.
This helps to avoid accidental data changes.

4) Explain one example where reference semantics matter in your code:
Reference semantics is important in ShoppingCart.
If we have two variables pointing to one basket, and we add an item through one of them, the changes will immediately appear in the other,
because both refer to the same object in memory.

let cartA = ShoppingCart()
let cartB = cartA
cartA.addItem(product: Product(...), quantity: 2)

print(cartB.itemCount) // 2 — it can be seen that they refer to the same object

If ShoppingCart were a structure, cartB would become a copy, and adding an item to cartA would not change cartB.
This would be inconvenient for a real application with one user's shopping cart.

5) Explain one example where value semantics matter in your code:
Value semantics is important in CartItem and Product.
When we copy a single cart item or product, we want the new variable to not affect the original.
This helps to avoid unexpected changes.

var item1 = CartItem(product: Product(...), quantity: 1)!
var item2 = item1
item2.updateQuantity(5)

print(item1.quantity) // 1
print(item2.quantity) // 5

item1 has not changed here, because CartItem is a structure (value type).
This is important so that each copy remains independent when working with the data in the trash.

6) What challenges did you face and how did you solve them?
During the assignment, I encountered several difficulties:
The error “Value of optional type must be unwrapped”
— It occurred when I was creating a CartItem using the failable initializer (init?).
Solution: I added! when creating it, because I knew for sure that the data was valid,
or I used guard let for secure extraction.
The error “Cannot find in scope 'product'”
occurred when I tried to access the product outside the scope.
Solution: I carefully checked if let index =... and I made sure that I use items[index].product.
Confusion between class and struct
— At first, the bucket was made as a struct, and the changes were not saved when passed to the function.
Solution: I replaced it with a class so that the object is passed by reference and has a common state.
Formatting prices and discounts
— I learned how to use calculated properties (var displayPrice: String) and reduce methods
to calculate the amount in the basket.
After that, the code became cleaner and clearer. I understood better
when to use classes (reference types) and when to use structures (value types).

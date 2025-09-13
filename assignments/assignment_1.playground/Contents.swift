import UIKit

//Step 1:
let myFirstName: String = "Leila"
let myLastName: String = "Umarova"
let myAge: Int = 20
let myBirthYear: Int = 2005
let myBirthMonth: String = "May"
let myHeight: Double = 1.59
let myWeight: Double = 50
let isStudent: Bool = true

//Bonus Challenge:
let currentYear: Int = 2025
let currentAge: Int = currentYear - myBirthYear

// Step2:
let myHobby: String = "Playing piano, drawing buildings, listening music"
let numberOfHobbies: Int = 3
let myFavoriteNumber: Int = 6
let myFavoriteColor: String = "Ocean Blue"
let myFavoriteBeverages: String = "Cocktail, Ice Latte, Ice tea"
let isHobbyCreative: Bool = true

//Bonus Tusk:
let fututreGoals: String = "Complete a bachelor's degree. Enter a master's program. Open yourself up to the field of architect"

//Emoji:
let emoji1: String = "🌊"
let emoji2: String = "🍹"
let emoji3: String = "✨"

//Step 3:
var lifeStory = "My name is \(myFirstName) \(myLastName). I'm \(currentAge). I was burn in \(myBirthYear) in \(myBirthMonth). My height is \(myHeight) and my weight is \(myWeight). I'm currently a student: \(isStudent). I have \(numberOfHobbies) hobbies, these are \(myHobby). My hobbies are creative: \(isHobbyCreative). My favorite number is \(myFavoriteNumber) and my favorite color is \(myFavoriteColor)\(emoji1). Also I have some favorite beverages, these are \(myFavoriteBeverages)\(emoji2). And finally my future goals are \(fututreGoals)\(emoji3)."

//Step 4:
print(lifeStory)

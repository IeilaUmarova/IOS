import UIKit

// FizzBuzz
print("PROBLEM 1 / FIZZBUZZ:")
for number in 1...100 {
    if number % 3 == 0 && number % 5 == 0 {
        print("FizzBuzz")
    }
    else if number % 5 == 0 {
        print("Buzz")
    }
    else if number % 3 == 0 {
        print("Fizz")
    }
    else {
        print(number)
    }
    
}
print("_____________________")

// Prime numbers
print("PROBLEM 2 / PRIME NUMBERS:")

func isPrime(_ number: Int) -> Bool {
    if number < 2 {
        return false
    }
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}

for number in 1...100 {
    if isPrime(number) {
        print(number)
    }
}
print("_____________________")

// Temperature Converter
print("PROBLEM 3 / UNIQUE CHARACTERS:")

var temperature: Double = 100
var unit: String = "C"

func celsiusToFahrenheit(_ degree: Double) -> Double {
    return (degree * 9.0/5.0) + 32.0
}

func celsiusToKelvin(_ degree: Double) -> Double {
    return (degree + 273.15)
}

func kelvinToFahrenheit(_ degree: Double) -> Double {
    return (degree - 273.15) * 9.0/5.0 + 32.0
}

func kelvinToCulsius(_ degree: Double) -> Double {
    return (degree - 273.15)
}

func fahrenheitToKelvin(_ degree: Double) -> Double {
    return (degree - 32.0) * 5.0/9.0 + 273.15
}

func fahrenheitToCelsius(_ degree: Double) -> Double {
    return (degree - 32.0) * 5.0/9.0
}

if unit == "C" {
    print("\(temperature)C = \(celsiusToFahrenheit(temperature))F")
    print("\(temperature)C = \(celsiusToKelvin(temperature))K")
}
else if unit == "K" {
    print("\(temperature)K = \(kelvinToCulsius(temperature))C")
    print("\(temperature)K = \(kelvinToFahrenheit(temperature))F")
}
else if unit == "F" {
    print("\(temperature)F = \(fahrenheitToKelvin(temperature))K")
    print("\(temperature)F = \(fahrenheitToCelsius(temperature))C")
}
else {
    print("Please inter only C, K or F!")
}
print("_____________________")
 
// Shopping List Manager
print("PROBLEM 4 / SHOPPING LIST MANAGER:")

var shoppingList: [String] = []

shoppingList.append("Butter")
shoppingList.append("Noodles")
shoppingList.append("Lemonade")
shoppingList.append("Chocolate")
print("\nAdded butter, noodles, lemonade, chocolate to the shoping list")

print("\nDisplay shopping list:")
for item in shoppingList {
    print(item)
}

shoppingList.remove(at: 1)
print("\nButter was removed from shopping list")

print("\nDisplay updated shoping list:")
if shoppingList.isEmpty{
    print("\nShopping list is empty")
}
else{
    for item in shoppingList {
        print(item)
    }
}

print("\nExiting Shopping List Manager")
print("_____________________")

// Word Frequency Counter
print("PROBLEM 5 / WORD FREQUENCY COUNTER:")

var sentence: String = "Success depends on the accuracy of each task's execution"
print("Enter sentence: \(sentence)")

let lowercasedSentence = sentence.lowercased()
let cleanedSentence = lowercasedSentence.components(separatedBy: CharacterSet.punctuationCharacters).joined()
let wordsSet = cleanedSentence.split(separator: " ")

var wordFrequency: [String: Int] = [:]

for word in sentence {
    let wordString = String(word)
    
    if let count = wordFrequency[wordString] {
        wordFrequency[wordString] = count + 1
    }
    else {
        wordFrequency[wordString] = 1
    }
}

for (word, count) in wordFrequency {
    print("\(word): \(count)")
}
print("_____________________")

// Fibonacci Sequence
print("PROBLEM 6 / FIBONACCI SEQUENCE:")

let n: Int = 10

func fibonacci(_ n: Int) -> [Int]{
    if n <= 0 {
        return []
    }
    
    if n == 1 {
        return [0]
    }
    
    var num1 = 0
    var num2 = 1
    var result: [Int] = [num1, num2]
    
    for _ in 0..<n {
        let num3 = num1 + num2
        result.append(num3)
        num1 = num2
        num2 = num3
    }
    return result
}

let sequence = fibonacci(n)
print("\(sequence)")

print("_____________________")

// Grade Calculator
print("PROBLEM 7 / GRADE CALCULATOR:")

let studentList: [String: Int] = [
    "Sanzhar": 96
    "Amina": 79
    "Miras": 83
    "Alina": 75
    "Bolat": 70
]

let scores = Array(studentList.values)
let average = Double(scores.reduce(0, +) / Double(scores.count))
let highest = scores.max()!
let lowest = scores.min()!

print("Average score: \(average)")
print("Highest score: \(highest)")
print("Lowest score: \(lowest)")

for (name, score) in studentList {
    if Double(score) > average {
        print("\(name): \(score) is above average")
    }
    else if Double(score) < average {
        print("\(name): \(score) is below average")
    }
    else {
        print("\(name): \(score) is average")
    }
}
print("_____________________")

// Palindrome Checker
print("PROBLEM 8 / PALINDROME CHACKER:")

let text: String = "window"

func isPalindrom(_ text: String) -> Bool {
    let characters = Array(text.lowercased())
    var firstIndex = 0
    var lastIndex = characters.count - 1
    while firstIndex < lastIndex{
        if characters[firstIndex] != characters[lastIndex]{
            return false
        }
        firstIndex += 1
        lastIndex -= 1
    }
    return true
}

if isPalindrom(text){
    print("\(text) is a palindrom")
}
else {
    print("\(text) is not palendrom")
}

print("_____________________")

// Simple Calculator
print("PROBLEM 9 / SIMPLE CALCULATOR:")

var num1: Double = 50
var num2: Double = 2
let operation: String = "+"
var result: Double?

func sum(_ num1: Double, _ num2: Double) -> Double? {
    return num1 + num2
}
func subtract(_ num1: Double, _ num2: Double) -> Double? {
    return num1 - num2
}
func multiply(_ num1: Double, _ num2: Double) -> Double? {
    return num1 * num2
}
func divide(_ num1: Double, _ num2: Double) -> Double? {
    if num2 == 0{
        return nil
    }
    return num1 / num2
}

switch operation {
case "+":
    result = sum(num1, num2)
case "-":
    result = subtract(num1, num2)
case "*":
    result = multiply(num1, num2)
case "/":
    result = divide(num1, num2)
    if result == nil {
        print("ERROR!")
    }
default :
    print("UNKNOWN OPERATION!")
}

if let newResult = result {
    print("Result: \(num1) \(operation) \(num2) = \(newResult)")
}
print("_____________________")

// Unique Characters
print("PROBLEM 10 / UNIQUE CHARACTERS:")

let word1: String = "may"
let word2: String = "morning"

func hasUniqueCharacters(_ text: String) -> Bool {
    var characters: Set<Character> = []
    
    for char in text {
        if characters.contains(char) {
            return false
        }
        characters.insert(char)
    }
    return true
}

print("\(word1) - \(hasUniqueCharacters(word1))")
print("\(word2) - \(hasUniqueCharacters(word2))")
print("_____________________")

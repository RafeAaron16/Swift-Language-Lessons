//String Literals
//This is a sequence of characters surrounded by double quotation marks

let someString = "Some string literal value"

print(someString)

//Multiple String Literals
//A sequence of characters surrounded by three double quotation marks

let quotation = """
    The White Rabbit put on his spectacles. "Where shall I begin,
    please your Majesty?" he asked.

    "Begin at the beginning," the King said gravely, "and go on
    till you come to the end; then stop."
"""

print(quotation)

/*
    Special Characters in String Literals

    \0 - null character
    \\ - backslash
    \t - horizontal tab
    \n - line feed
    \r - carriage return
    \" - double quotation mark
    \' - single quotation mark
    \u{<number>} - 1-8 digiit hexadecimal number
*/

let dollarSign = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"


print(dollarSign)
print(blackHeart)
print(sparklingHeart)

//Extended String Delimiters
//Surrounding String literals with # removes the 
//effect of special characters

let threeMoreDoubleQuotationMarks = #"""
    Here are three more double quotes: """
"""#

/*
Initializing an Empty String
*/
var emptyString = ""
var anotherEmptyString = String()

//checkIfAStringIsEmpty
if emptyString.isEmpty {
    print("Nothing to see here")
}

//String mutability is given by using either var or let

var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
//constantString += " and another Highlander"
//the statement above throws an error

//Strings are passed or assigned using a copy of them
//The original string is not passed.

//Working with Characters
//Accessing individual characters is done using a for in loop

for character in "Dog🐶" {
    print(character)
}

//It can also be defined as a stand alone character
let exclamationMark:Character = "!"

//Strings can be formed from an array of characters

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱", "\n"]
let catString = String(catCharacters)
print(catString)

//Concatenating Strings and Characters
//string1 + string2 or string1 += string2 or string1.append(character)

//String interpolation
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

print(#"Write an interpolated string in Swift using \(multiplier)"#)

//to bypass this
print(#"Write an interpolated string in Swift using \#(multiplier)"#)

//Counting Characters
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMengerie has \(unusualMenagerie.count) characters")

//String Indices 
let greeting = "Gluten Tag"

print(greeting[greeting.startIndex])
print(greeting.index(before: greeting.endIndex))
print(greeting[greeting.index(after: greeting.startIndex)])

let index = greeting.index(greeting.startIndex, offsetBy: 7)
print(greeting[index])

//Inserting and Removing
var welcome = "hello"
welcome.insert("!", at:welcome.endIndex)
print(welcome)

welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
print(welcome)

//Removing a part of a string
welcome.remove(at: welcome.index(before: welcome.endIndex))
print(welcome)

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)

print(welcome)

//Substrings
let greeting1 = "Hello, world!"
let index1 = greeting1.firstIndex(of: ",") ?? greeting1.endIndex
let beginning = greeting1[..<index1]

let newString = String(beginning)

print(newString)

//Comparing Strings
//String and character equality

let quotation1 = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."

if quotation1 == sameQuotation {
    print("These two strings are considered equal")
}
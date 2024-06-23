/*
    Control Flow
    Swifts control flow statements originate from if, guard and switch statements

    Others like continue and break transfer flow of execution to another point in your code

    Swift provides a for in loop to iterate over arrays, dictionaries, ranges, strings and other sequences

    Swift also provides defer statements to execute code when leaving the current scope
*/

/*
    For in loops - To iterate over a sequence ir array, ranges of numbers or characters in a string
*/

let names = ["Anna", "Alex", "Brian", "Jack"]

for name in names {
    print("Hello, \(name)")
    
}

//in a dictionary
let numberOfLegs = ["spider": 8, "ant": 6, "cat":4]

for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

//in a range
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

//Using an underscore ignores the values in a sequence
let base = 3
let power = 10
var answer = 1

for _ in 1...power {
    answer *= base
}

print("\(base) to the power of \(power) is \(answer)")

//Use the half-open operator ..< to include the lower bound but not the upper bound
let minutes = 60

for tickMark in 0..<60 {
    print("\(tickMark) ")
}

//We can use stride to skip numbers

let minuteInterval = 5

for tickMark in stride(from: 0, to: 60, by: minuteInterval){
    print("\n\(tickMark) ")
}

//Closed ranges are available using through instead of to

/*
    While loops
    Performs a set of statements until a condition becomes false
    Swift provides two kinds of while loops

    while evaluates its condition at the start of each pass through the loop
    repeat-while evaluates its condition at the end of each pass through the loop
*/

//While
var numberOfTimes = 6

while numberOfTimes != 0 {
    print("Times remaining: \(numberOfTimes)")
    numberOfTimes -= 1
}

//Repeat-while
//This performs a single pass through the loop block first

var numberOFTimes2 = 10

repeat {
    print("Times remaining: \(numberOFTimes2)")
    numberOFTimes2 -= 1
}while numberOFTimes2 != 0

//Conditional statements
    //If - executes only if that condition is true
    //else if- executes when upper if statements  return false
    //else - executes when all if statements return false

var temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf")
}
else if temperatureInFahrenheit >= 86{
    print("It's really warm. Don't forget to wear sunscreen")
}
else {
    print("It's not that cold. Wear a T-shirt")
}

//It can also be used to assign a value based on a number of factors

let weatherAdvice  = if temperatureInFahrenheit <= 0 {
    "It's very cold. Consider wearing a scarf"
}
else if temperatureInFahrenheit >= 30{
    "It's really warm. Don't forget to wear sunscreen"
}
else{
    "It's not that cold. Wear a T-shirt"
}

print(weatherAdvice)

//Switch
// A switch statement considers a value and compares it against several possible
//matching patterns. It then executes an appropriate block of code based on the first pattern that matches successfully

let someCharacter:Character = "z"

switch someCharacter {
    case "a":
        print("The first letter of the Latin alphabet")

    case "z":
        print("The last letter of the Latin alphabet")

    default:
        print("Some other character")
}

//It can be used to assign a variable like an if statement

let anotherCharacter: Character = "a"

switch anotherCharacter {
    case "a", "A":
        print("The letter A")
    
    default:
        print("Not the letter A")
}

//Interval Matching
let approximateCount = 62
let countedThings = "moons orbitting Saturn"
let naturalCount: String

switch approximateCount {
    case 0:
        naturalCount = "no"

    case 1..<5:
        naturalCount = "a few"

    case 5..<12:
        naturalCount = "several"

    case 12..<100:
        naturalCount = "dozens of"

    case 100..<1000:
        naturalCount = "hundreds of"
    
    default:
        naturalCount = "many"
}

print("There are \(naturalCount) \(countedThings).")

//Tuples
let somePoint = (1, 1)

switch somePoint {
    case (0, 0):
        print("\(somePoint) is at the origin")

    case (_, 0):
        print("\(somePoint) is on the x-axis")

    case (0, _):
        print("\(somePoint) is on the y-axis")

    case (-2...2, -2...2):
        print("\(somePoint) is inside the box")

    default:
        print("\(somePoint) is outside of the box")
}

//Value Bindings
let anotherPoint = (2, 0)

switch anotherPoint {
    case (let x, 0):
        print("on the x-axis with an x value of \(x)")

    case (0, let y):
        print("on the y-axis with a y value of \(y)")

    case let(x, y):
        print("somewhere else at (\(x), \(y))")

}

// A switch case can use a where clause to check for additional conditions
let yetAnotherPoint = (1, -1)

switch yetAnotherPoint {
    case let(x, y) where x == y:
        print("(\(x), \(y)) is on the line x ==y")

    case let(x, y) where x == -y:
        print("(\(x), \(y)) is on the line x == -y")

    case let (x, y):
        print("(\(x), \(y)) is just some arbitrary point")
}

//Early Exit using a guard statement

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }

    print("Hello \(name)!")

    guard let location = person["location"] else {
        print("I hope the weather is nice near you")
        return
    }

    print("I hope the weather is nice in \(location)")
}

greet(person: ["name": "Rafe Aaron"])

greet(person: ["name": "Jane", "location": "Cupertino"])
//Lastly the defer action
//defer blocks are executed at the end of a local scope

var score = 3

if score < 10 {
    defer {
        print(score)
    }

    defer {
        print ("The score is: ")
    }

    score += 5
}
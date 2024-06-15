//Constants use the let keyword
let myname = "Rafe Aaron"
let gender = "Male"

//Variables use the var keyword
var age = 20
var height = 6.1

//Variables and constants don't need to be assigned immediately
var marks:Int
let gpa:Int

//Multiple variables can be assigned
var x = 0.0, y = 0.0, z = 0.0

//Type annotations
var welcomeMessage: String
welcomeMessage = "Hello"

var red, blue, green: Double

//Printing Constants and Variables
print(welcomeMessage)

//Adding other fields
print("I am currently \(age) years old")

//Interger bounds
let minValue = UInt8.min
let maxValue  = UInt8.max

print("Minimum integer value is \(minValue)\nMaximum integer value is \(maxValue)")

/*Floats and doubles
Double represents a 64-bit floating-point number
Float represents a 32-bit floating-point number
*/

//Swift also supports type inference

/*Type Aliases
    These define an alternate name for an existing type
    Type aliases are defined with the typealias keyword
*/

typealias Digit = UInt16
var accountBalance: Digit = 2_000

print("Your current account balance is \(accountBalance)")

//Booleans - Bool
let orangesAreOrange = true
let tomatoesAreBlue = false

if orangesAreOrange {
    print("Now that's a fact")
}else{
    print("I smell a lie🙃🙃")
}

/* Tuples
    Tuples group multiple values into a single compound value
*/

let http404Error = (404, "Not Found")

//Tuple decomposition
let (statusCode, statusMessage) = http404Error

print("Status Code: \(statusCode)\nStatus Message: \(statusMessage)")

//To ignore parts of a tuple decomposition, just use '_'

let(myStatusCode, _) = http404Error

print("I just want my status Code: \(myStatusCode)");

//Alternatively, we can use numbers to specify elements in a tuple
print("Hello, World! My Status Code is \(http404Error.0)")

//Tuples can also be defined individually
let http200Status = (statusCode200:200, description:"Ok")

//Then you can use tuple names to decompose the tuple
print("The status code is \(http200Status.statusCode200)")

/*nil
    Defining an optional variable without providing a default value,
    the variable is automatically set to nil
*/

var surveyAnswer: String?

/*
Optional binding
    You can use optional bindiing to find out whether an optional conatains a value
    If so we can make that value available as a temporary constant or variable

    Binding can be used with guard, if and while statements to check for a value inside an optional
*/
var possibleNumber = "123"
if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
}else{
    print("The string \"\(possibleNumber)\" couldn't be converted to an integer")
}

/*Providing a Fallback Value
    You can handle a missing value by using nil-coalescing operator(??)
    If the optional on the left of the ?? isn't nill, that value is unwrapped and used
    Otherwise, the value on the right of ?? is used.
*/

let name: String? = nil

let greeting = "Hello, " + (name ?? "friend") + "!"

print(greeting)

/* Force Unwrapping
    when nil represents an unrecoverable failure, such as a programmer error or corrupted state,
    you can access the underlying value by adding an exclamation mark(!) to the end of the optionals name.
    This is called force unwrapping the optionals valuel
*/

let secondPossibleNumber = "12k"
let convertedNumber = Int(secondPossibleNumber)

//let number = convertedNumber!

/*guard let number = convertedNumber else {
    fatalError("The number was invalid")
}*/
/*
    Structures and Classes
    Model custom types that encapsulate data

    An instance of a class is traditionally known as an object
*/

//Definition syntax
//Struct
struct SomeStructure {
    //structure definition goes here
}

class SomeClass {
    //class definition goes here
}

//Example
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//Structure and Class Instances
let someResolution = Resolution()
let someVideoMode = VideoMode()

//Accessing properties
//Use the dot syntax

print("The width of someResolution is \(someResolution.width)")

print("The width of someVideoMode is \(someVideoMode.resolution.width)")

//Memberwise Initializers
let vga = Resolution(width: 640, height: 480)

//Structures and Enumerations are Value Types
// A value type is a type whose value is copied when it's assigned to a variable
//or constant, or when it is passed to a function

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

//Same behavior applies to enumerations

enum CompassPoint {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}

var currentDirection = CompassPoint.west

let rememberedDirection = currentDirection

currentDirection.turnNorth()

print("The current direction is \(currentDirection)")
print("The remembered direction is \(rememberedDirection)")

//Classes are reference types
//Unlike value types, reference types are not copied when they're assigned

let tenEighty = VideoMode()

tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty

//Identity Operators
//("===") and ("!==")

if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance")
}
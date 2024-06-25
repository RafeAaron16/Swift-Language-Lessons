/*
    Enumerations
    Model Custom types that define a list of possible values
    An enumeration defines a common type for a group of related values and enables
    you to work  with those values in a type-safe way within your code
*/

//Enumeration Syntax
enum SomeEnumeration {
    //enumeration definition goes here
}

enum CompassPoint {
    case north
    case south
    case east
    case west
}

//They can also appear in the same line
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

//Usage
var directionToHead = CompassPoint.west
directionToHead = .east

//Matching Enumeration Values with a Switch Statement
directionToHead = .south

switch directionToHead {
    case .north:
        print("Lots of planets have a north")

    case .south:
        print("Watch out for penguins")

    case .east:
        print("Where the sun rises")

    case .west:
        print("Where the skies are blue")
}

//iterating over Enumeration Cases
enum Beverage: CaseIterable{
    case coffee, tea, juice
}

let numberOfChoices = Beverage.allCases.count

print("\(numberOfChoices) beverages available")

for beverage in Beverage.allCases {
    print("\(beverage)")
}

//Associated Values

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)

//Using them with switch
switch productBarcode {
    case .upc(let numberSystem, let manufacturer, let product, let check):
        print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")

    case .qrCode(let productCode): 
        print("QR code: \(productCode)")
}

//Raw values
//These are default values

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

//Implicit raw value
enum Planet2: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

enum CompassPoint2: String {
    case north, south, east, west
}

//INitializing from rawValue

let possiblePlanet = Planet2(rawValue: 7)
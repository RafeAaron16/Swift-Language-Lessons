/*
    Initialization
    Set the initial values for a type's stored properties and perform one-time setup

    Initialization is the process of preparing an instance of a class, structure, or enumeration for use.
    This process involves setting an initial value for each stored propert
    on that instance and performing any other setup or initialization that's required before the 
    new instance is ready for use
*/

/*
    Initializers
    These are called to create a new instance of a particular type

    Syntax
    init() {
        perform some initialization here
    }
*/
struct Fahrenheit {
    var temperature: Double 

    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("The default temperature is \(f.temperature) Fahrenheit")

/*
Default property values
struct Fahrenheit {
    var temperature = 32.0
}
*/

//Initialization Parameters

struct Celcius {

    var temperatureInCelcius: Double

    init(fromFahrenheit fahrenheit:Double) {
        temperatureInCelcius = (fahrenheit - 32.0) / 1.8
    }

    init(fromKelvin kelvin: Double) {
        temperatureInCelcius = kelvin - 273.15
    }
}

let boilingPointOfWater = Celcius(fromFahrenheit: 212.0)

let freezingPointOfWater = Celcius(fromKelvin: 273.15)

struct Color {
    let red, green, blue: Double

    init(red: Double, green: Double, blue: Double) {

        self.red = red
        self.green = green
        self.blue = blue
    }

    init(white: Double) {

        red = white
        green = white
        blue = white
    }

}

//Optional Property Types

class SurveyQuestion {

    var text: String
    var response: String?

    init(text: String) {
        self.text = text
    }

    func ask() {
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")

cheeseQuestion.ask()

cheeseQuestion.response = "Yes, I do like cheese"

/*
    Default Initializers
*/  

class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()

// Memberwise Initializers for Structure Types
struct Size {
    var width = 0.0
    var height = 0.0
}

let twoByTwo = Size(width: 2.0, height: 2.0)

//Initialization Delegation for Value Types
//Initializers can call other initializers to perform part
//of an instance's initializers

//Failable Initializers
//An initializer that can fail

struct Animal {

    let species: String

    init?(species: String) {
        if species.isEmpty {return nil}

        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")

if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}

//Failable initializers for enumerations

enum TemperatureUnit {

    case kelvin, celcius, fahrenheit

    init?(symbol: Character) {

        switch symbol {
            case "K":
                self = .kelvin

            case "C":
                self = .celcius

            case "F":
                self = .fahrenheit

            default:
                return nil
        }
    }
}

//Required Initializers
class SomeClass {

    required init() {
        //initializer implementation goes here
    }
}

class SomeSubclass: SomeClass {
    required init() {
        //subclass implementation of the required initializer goes here
    }
}
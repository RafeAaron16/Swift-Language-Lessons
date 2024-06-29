/*
    Protocols
    Define requirements that conforming types must implement.

    A protocol defines a blueprint of methods, properties and other requirements
    that suit a particular task or piece of functionality
*/

//Protocol Syntax
/*
    protocol SomeProtocol {
        // protocol definition goes here
    }

    struct SomeStructure: SomeProtocol {

    }

    //If there is a superclass, place it before the protocols
    class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol {
        // class Definition goes here
    }
*/

protocol SomeProtocol {
    var mustBeSettable: Int { get set}
    var doesNotNeedToBeSettable: Int {get}
}

//Usage
protocol FullyNamed {
    var fullName: String { get }
}

struct Person2: FullyNamed {
    var fullName: String
}

let john = Person2(fullName: "Rafe Aaron")

print(john.fullName)

class Starship: FullyNamed {
    var prefix: String?
    var name: String

    init(name: String, prefix: String? = nil){
        self.name = name
        self.prefix = prefix
    }

    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}

var ncc1701 = Starship(name: "Enterprise", prefix: "USS")


//In methods
protocol SomeProtocol2 {
    static func someTypeMethod()
}

protocol RandomNumberGenerator {
    func random() -> Double
}

//In mutating methods
protocol Togglable {
    mutating func toogle()
}

//Initializer Requirements
protocol SomeProtocol3 {
    init(someParameter: Int)
}

//Protocols can inherit from other protocols

//Protocol Composition
protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy Birthday, \(celebrator.name), you're \(celebrator.age)")
}

let birthdayPerson = Person(name: "Malcom", age: 21)

wishHappyBirthday(to: birthdayPerson)
/*
    Methods
    Define and call functions that are part of an instance or type
    Methods are functions that are associated with a particular type
    Classes, structures and enumerations can also define type methods, which are associated with the type itself
*/

/*
    Instance Methods
    These are functions that belong to instances of a particular class, structure or enumeration
    An instance method has implicit access to all other instance methods and properties
    of that type
*/

class Counter {
    var count = 0
    func increment() {
        count += 1
    }

    func increment(by amount: Int) {
        count += amount
    }

    func reset() {
        count = 0
    }
}

//The self Property
/*
    Every instance of a type has an implicit property called self
    which is exactly the equialent to the instance itself

    func increment() {
        self.count
    }
*/

//Modifying Value Types from Within Instance Methods
//Structures and enumerations are value types meaning they can't be modifies
//from within their instance methods
//Fortumately, we can use the mutating behavious fot that method

//But you can't call a mutating function on a constant of a structure

struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var somePoint = Point(x: 1.0, y: 1.0)

somePoint.moveBy(x: 2.0, y: 3.0)

print("The point is now at (\(somePoint.x), \(somePoint.y))")

//Assigning to self Within a Mutating Method
//Mutating methods can assign an entirely new instance to the implicit self property

struct Point1 {
    var x = 0.0, y = 0.0

    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point1(x: x + deltaX, y: y + deltaY)
    }
}

//Mutating functions for enumerations can set the implicit self parameter to be a different
//case from the same enumeration

enum TriStateSwitch {
    case off, low, high

    mutating func next() {
        switch self {
            case .off:
                self = .low

            case .low:
                self = .high

            case .high:
                self = .off
        }
    }
}

var ovenLight = TriStateSwitch.low
print(ovenLight)
ovenLight.next()
print(ovenLight)
ovenLight.next()
print(ovenLight)

//Type methods
//Use either static or class

class SomeClass {
    class func someTypeMethod() {
        //type method implementation goes here
    }
}

SomeClass.someTypeMethod()
/*
    Inheritance
    Subclass to add or override functionality

    A class can inherit methods, properties and other characteristics from another class

    The inheriting class is known as a subclass
    The class it inherits from is known as a superclass

    Classes can also add property observers to inherited properties
    in order to be notified when the value of a property changes.
*/

/*
    Defining a Base Class
    Any class that doesn't inherit from another class is known as a base class
*/

class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "Travelling at \(currentSpeed) miles per hour"
    }

    func makeNoise() {
        //do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}

/*
    Subclassing
    Subclassing is the act of basing a new class on an existing class
    The subclass inherits characteristics from the existing class, which you can then refine
    You can also add new characteristics to the subclass
*/

class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true

/*
    Overriding
    A subclass can provide it's own custom implementation of an instance method,
    type method, instance property, type property, or subscript that it would otherwise
    inherit from a superclass.

    This is known as overriding
*/

//Overriding Methods
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()

//Overriding properties
//You can override an inherited instance or type property to
//provide your own custom getter and setter for that property

class Car: Vehicle {
    var gear = 1

    override var description: String {
        return super.description += " in gear \(gear)"
    }
}

/*
    Overriding Property Observers
    You can use property overriding to add property observers to an inherited
    property
*/

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

//To prevent overrides, you do this by using the final modifier
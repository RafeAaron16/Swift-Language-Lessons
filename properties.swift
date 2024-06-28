/*
    Properties
    Access stored and computed values that are part of an instance or type
    Properties associate values with a particular class, struct or enumeration
    Stored properties store constant and variable values as part of an instance
    Computed properties calculate a value

    Computed properties are provided by classes, structures and enumerations
    Stored properties are only provided by classes and structures
*/

//Stored Properties
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

//var or let influence the mutability of stored properties
//The above piece of code will return an error when let is used but only for structs
//The class instance isn't affected since it is a reference type

//Lazy Stored Properties
//A lazy stored property is a property whose initial value isn't calculated
//until the first time it is used.
//only variables can be declared lazy

class DataImporter {
    var filename = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data: [String] = []
}

let manager = DataManager()
manager.data.append("Some Data")
manager.data.append("Some more data")

//Here the lazy variable hasn't been initialized yet

print(manager.importer.filename)
//The lazy variable is now initialized
//If accessed by multiple threads, there's no guarantee that the property will be called only once

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))

let initialSquareCenter = square.center


square.center = Point(x: 15.0, y: 15.0)

print("Square.origin is now at (\(square.origin.x), \(square.origin.y))")

//Read only computed values
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("The volume of the fourByFiveByTwo is \(fourByFiveByTwo.volume)")

//Property observers
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }

        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

//Static variables
// use static var someVariable to set a Type Value

//Property Values
@propertyWrapper
struct TwelveOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { return number}
        set {number = min(newValue, 12)}
    }
}

struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print(rectangle.height)

rectangle.height = 10
print(rectangle.height)

rectangle.height = 24
print(rectangle.height)

//Setting Initial Values for Wrapped Properties
@propertyWrapper
struct SmallNumber {
    private var maximum: Int
    private var number: Int

    var wrappedValue: Int {
    get {return number}
    set {number = min(newValue, maximum)}
    }

    init() {
        maximum = 12
        number = 0
    }

    init(wrappedValue: Int) {
        maximum = 12
        number = min(wrappedValue, maximum)
    }

    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}
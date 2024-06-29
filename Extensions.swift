/*
    Extensions
    Add fuunctionality to an existing type

    Extensions add new functionality to an existing class, structure,
    enumeration or protocol type
*/

//Extension Syntax
/*
    extension SomeType {
        //new fuunctionality to add to SomeType goes here
    }

    //It can extend an existing type to make it adopt one or more protocols
    extension SomeType: SomeProtocol, AnotherProtocol {
        //implementation of protocol requirements goes here
    }
*/

//Computed Properties

extension Double {
    var km: Double { return self * 1_000.0}
    var m: Double { return self }
}

let oneKm = 25.4.km
print("One kilometer is \(oneKm) kilometers")

//Initializers
struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0,height: 3.0))

//Methods
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}

3.repetitions {
    print("Hello")
}

//Mutating Instance Methods
extension Int {
    mutating func square() {
        self = self * self
    }
}

var someInt = 3
someInt.square()

//Subscripts
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1

        for _ in 0..<digitIndex {
            decimalBase *= 10
        }

        return (self / decimalBase) % 10
    }
}
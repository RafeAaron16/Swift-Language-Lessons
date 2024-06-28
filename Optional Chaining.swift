/*
    Optional Chaining
    Used to access members of an optional value without unwrapping

    Optional chaining is a process for querying and calling properties, methods and subscripts
    on an optional that might currently be nil
*/

class Person {
    var residence: Residence?
}

class Residence {
    var numberOfRooms = 1
}

let john = Person()

//let roomCount = john.residence!.numberOfRooms
//The above variable triggers a runtime error

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
}else {
    print("Unable to retrieve the number of rooms.")
}

john.residence = Residence()

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
}
else{
    print("Unable to retrieve the number of rooms.")
}

class PersonNew {
    var residence: ResidenceNew?
}

class ResidenceNew {
    var rooms: [Room] = []
    var numberOfRooms: Int {
        return rooms.count
    }

    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }

    func printNumberOfRooms(){
        print("The number of rooms is \(numberOfRooms)")
    }

    var address: Address?
}

class Room {
    let name: String
    init(name: String) {self.name = name}
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?

    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}

let mike = PersonNew()

if let roomCount = mike.residence?.numberOfRooms {
    print("Mike's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

let someAddress = Address()

someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
//john.residence?.address = someAddress

func createAddress() -> Address {
    print("Function was called")

    let someAddress = Address()

    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"

    return someAddress
}

mike.residence?.address = createAddress()

//Multiple levels of chaining
if let mikesStreet = mike.residence?.address?.street {
    print("Mike's street name is \(mikesStreet).")
} else {
    print("Unable to retrieve the address")
}
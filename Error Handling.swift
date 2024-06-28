/*
    Error Handling
    Respond to and recover from errors.

    This is the process of responding to and recovering from error conditions
    in your program
*/

//Representing and Throwing Errors
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

/*
    Throwing an error
    thow VendingMachineError.insufficientFunds(coinsNeeded: 5)
*/

/*
    Handling Errors
    There are four ways to handle errors in swift

    1. Propagate the error from a function to the code that calls the function
    2. Handle the error using a do-catch statement
    3. Handle the error as an optional value
    4. Assert that the error will not occur
*/

//Propagating errors suing Throwing Functions

//func canThrowErrors() throws -> String

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]

    var coinsDeposited = 0

    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else{
            throw VendingMachineError.invalidSelection
        }

        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }

        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }

        coinsDeposited -= item.price

        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem

        print("Dispensing \(name)")

    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]

func buyFavoriteSnack(person: String, VendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try VendingMachine.vend(itemNamed: snackName)
}

struct PurchasedSnack {
    let name: String

    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

//Handling errors using Do-Catch

var vendingMachine = VendingMachine()

vendingMachine.coinsDeposited = 8

do {
    try buyFavoriteSnack(person: "Alice", VendingMachine: vendingMachine)
    print("Success! Yum.")
}
catch VendingMachineError.invalidSelection {
    print("Invalid Selection")
}
catch VendingMachineError.outOfStock {
    print("Out of Stock")
}
catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please inser an additional \(coinsNeeded) coins.")
}
catch {
    print("Unexpected error: \(error).")
}

func nourish(with item: String) throws {

    do {
        try vendingMachine.vend(itemNamed: item)
    }
    catch is VendingMachineError {
        print("Couldn't buy that from the vending machine")
    }
}

do {
    try nourish(with: "Beef-Flavored Chips")
}catch {
    print("Unexpected non-vending-machine-related error: \(error)")
}

//Converting Errors to Optional Values
func someThrowingFunction() throws -> Int {
    print("Error")
    return 23
}

let x = try? someThrowingFunction()

let y: Int?

do {
    y = try someThrowingFunction()
} catch {
    y = nil
}

//Disabling Error Propagation
//Use the ! operator when you are sure that the error won't occur at runtime

//let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")


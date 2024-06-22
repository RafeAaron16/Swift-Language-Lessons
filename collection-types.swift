/*
Collection Types in Swift
Organize data usiing arrays, sets and dictionaries
*/

/*
    Arrays are ordered collections of values
    Sets are unordered collections of unique values
    Dictionaries are unordered collections of key-value associations

    Arrays, Sets and Dictionaries are implemented as generic collections

    If any is assigned to a variable, then it can be edited. It is thus mutable
    If any is assigned to a constant, then it can't be edited. It is thus immutable
*/

/*
    Array Type Shorthand Syntax
    Either: Array<Element> or [Element]

    Element is the types of values the array is allowed to store
*/

//Create an Empty Array
var someInts: [Int] = []
print("someInts is of type [Int] with \(someInts.count) items.")
//Prints "someInts is of type [Int] with 0 items"
//If some hint is already present, then the type doesn't need to be specified ie someInts = anotherarray

//Creating an Array with a default Value
//You can intitialize a swift array with an initializer to set some deafult values
var threeDoubles = Array(repeating: 0.0, count: 4)
print(threeDoubles)

//You can also concatenate two array into one

var anotherThreeDoubles = Array(repeating: 2.5, count: 4)

var sixDoubles = threeDoubles + anotherThreeDoubles

print(sixDoubles)

//Creating an Array with an Array Literal
var shoppingList: [String] = ["Eggs", "Milk"]
print("My shopping list \(shoppingList)")

//Accessing and Modifying an Array
print("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty {
    print("The shopping list is empty.")
}
else{
    print("The shopping list isn't empty")
}


//Adding to an array
//Either add with the append function or using the += assignment operator

shoppingList.append("Flour")

shoppingList += ["Baking Powder", "Chocolate Spread", "Cheese", "Butter"]

//To access any item, use the index
var firstItem = shoppingList[0]
print("The first item in the array is \(firstItem)")

//Change can also be index based
shoppingList[0] = "Six eggs"
print("The first item has been changed: \(shoppingList)")

//Subscript operation
shoppingList[4...6] = ["Bananas", "Apples"]
print("The shopping list has been changed: \(shoppingList)")

//Inseting at a particular index
shoppingList.insert("Maple Syrup", at: 0)
print("The shopping list has been changed: \(shoppingList)")

//Removing at a particular index
shoppingList.remove(at: 0)
print("The shopping list has been changed: \(shoppingList)")

//to remove last element, use removeLast()
shoppingList.removeLast()

//Iterating over an array
for item in shoppingList {
    print(item)
}

//To also get the index of an item, use the enumerated function
for (index, item) in shoppingList.enumerated() {
    print("Item \(index + 1): \(item)")
}

/*
    Sets - Stores distinct values of the same type in a collection with no defined ordering
    All items in a set need to be hashable
    All basic swift types are hashable
*/

//Is initialized using Set<Element>
//Element is the type that the set is allowed to store
//Set doesn't have an initialized short form
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

//it can also be initalized from another source if it offers that context
letters.insert("a")

letters = []

//A set can be created with an Array Literal
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip Hop"]

//It can be written as

var favoriteGenres2: Set = ["Rock", "Classical", "Hip Hop"]

//To remove, we can use the remove and specify a value to remove

if let removedGenre = favoriteGenres2.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
}
else{
    print("I never much cared for that")
}

//One can also use the contains method to check if it contains a certain element
if favoriteGenres2.contains("Classical") {
    print("I get up on the good foot")
}
else{
    print("It's too boring in here")
}

//It can be sorted usiing the set.sorted() method and can be iterated like an Array

//Performiing Set Operations
/*
    union - a.union(b)
    intersection - a.intersection(b)
    subtracting - a.subtracting(b)
    symmetricDifference - a.symmetricDifference(b)
    isequal - use == operator
    isSubset(of: ) - a.isSubset(of: b)
    isSuperset(of: )
    isStrictSubset(of: )
    isStrictSuperset(of: )
    isDisjoint(with: )
*/

/*
Dictionaries
Can be written as <Key, Value> or [Key: Value]
intialized as [:]
*/

//Creating an empty dictionary
var namesOfIntegers: [Int: String] = [:]
namesOfIntegers[16] = "sixteen"

//Can also be initialized with literals
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

//it can also be written as
var airports2 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

//It can be updated either by assigning a key a value
//Or by using the updateValue(Value, forKey: Key)

if let oldValue = airports2.updateValue("Dublin", forKey: "DUB") {
    print("The old value for DUB was \(oldValue)")
}

//A value can be removed using nil
airports2["DUB"] = nil

//Or using removeValue(forKey: Key) which returns the removed value

//Iterating over a dictionary
for (airportCode, airportName) in airports {
    print("Airport Code: \(airportCode) Name: \(airportName)")
}

//dict.keys() returns the keys in a dictionary
//dict.values() returns the values in a dict


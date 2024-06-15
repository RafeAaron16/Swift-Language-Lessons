/*
    An operator is a special symbol or phrase that use to check, change, or combine values
    Operators include: + - / * %
    Range operators: a...b, a..<b

    Categories include: unary, binary, ternary

    unary operators: operate on a single target (-a, !b, c!)
    binary operators: operate on 2 targets (2 + 4)
    ternary operators: operate on two targets (a ? b : c)

    operators affect operands
*/

//Assignment operator
let b = 10
var a = 5

a = 5

let (x, y) = (1, 2)

//Arithmetic operators
// + - * /

1 + 2
2 - 1
2 * 3
10 / 5

//Remainder operator
9 % 4

//Unary Minus Operator
let three = 3
let minusThree = -three
let plusThree = -minusThree

//Unary Plus Operator
let six = 7
let plusDesktop = +six

//Compound Assignment Operators
var a = 1
a += 2

/*Comparison Operators
    Equal to (a == b)
    Not equal to (a != b)
    Greater than (a > b)
    Less than (a < b)
    Greater than or equal to (a >= b)
    Less than or equal to (a <= b)
    Two identity operators (===, !==) check instance similarities
*/

/*
    Tuple comparison
*/
(1, "zebra") < (2, "apple") //returns true
(3,"apple") < (3, "bird") //returns true
(4, "dog") == (4, "dog")

//< compares Booleans

//Ternary Conditional Operator
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
//rowHeight is equal to 90

//Nil-Coalescing Operator (a ?? b)
/*
    Unwraps an optional a if it contains a value
    or returns a default value b if a is nil
*/
//Complete version
a != nil ? a! : b

//Shorthand version
let defaultColorName = "red"
var userDefinedcolorName: String? // defaults to nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
//colorNameToUse returns red

/*
    Range Operators

    Closed Range Operator 1...5
*/

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

/*
    Half-Open Range Operator a..<b
*/

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count

for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}

/*
    One-Sided Ranges
*/

for name in names[2...] {
    print(name)
}

//Checking ranges for certain values

let range = ...5

range.contains(7)
range.contains(4)
range.contains(-1)

/*
    Logical Operators modify or combine the Boolean logic
*/

/*
Logical NOT (!a)
Logical AND (a && b)
Logical OR (a || b)

if a && b {}
if !a {}
if a || b {}

Explicit parentheses
if (a && b) || c || d {}
*/
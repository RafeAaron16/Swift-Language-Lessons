/*
    Functions
    functions are self contained chunks of code that perform a specific task
    Give a function a name that itentifies what it does, this name is used to call the function
    to perform it's task when needed
*/

/*
    Defining and Calling Functions  
*/

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

print(greet(person: "Rafe Aaron"))

//Function parameters and return values
//Functions aren't required to define input parameters. eg

func sayHelloWorld() -> String {
    return "Hello, World!"
}

print(sayHelloWorld())

//Functions aren't required to define a return type
func greetOne(person: String) {
    print("Hello \(person)")
}

greetOne(person: "Steve")

/*
    Functions with return values can be ignored when called
*/

func printAndCount(string: String) -> Int {
    print(string)
    return string.count
}

func printWithoutCounting(string: String) {
    let _ = printAndCount(string: "I wont be counted😥")
}

print(printAndCount(string: "This prints a name and it's count"))

print(printWithoutCounting(string: "This prints a name minus it's count"))

/*
    Functions with Multiple Return Values
    To do this we use a tuple as the return type for a function
*/

func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]

    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        }

        else if value > currentMax {
            currentMax = value
        }

    }

    return (currentMax, currentMin)
}

let bounds = minMax(array: [8, -6, 2, 109, 3, 71])

print("min is \(bounds.min) and max is \(bounds.max)")

// If the function has one line of code, it returns the value of that line of code

/*
    Function Argument Labels
*/

func someFunc(argumentLabel firstParameter: Int) {

}

someFunc(argumentLabel: 5)

//They can equally be omitted using an underscore

func someOtherFunction(_ firstParameterName:Int){

}

someOtherFunction(1)

//Default parameter values
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 20) {

}

/*
    Variadic parameters
    A variadic parameter acceps zero or more vales of a specifired type
    these parameter values are made available as an array in the local scope of the function
*/

func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }

    return total / Double(numbers.count)
}

let firstValue = arithmeticMean(1, 2, 3, 4, 5, 6)
let secondValue = arithmeticMean(3, 8.25, 18.75)
print(firstValue)
print(secondValue)

/*
    Function Types
    Every function has a specific return type, made up of the parameter types and the return type of the function
*/

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

/*
    Using function Types
*/

var mathFunction: (Int, Int) -> Int = addTwoInts

print("Result: \(mathFunction(4, 7))")

/*
    Function Types as Parameter Types
*/

func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

/*
    Nested Functions
*/

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1  }
    func stepBackward(input: Int) -> Int {  return input - 1  }

    return backward ? stepBackward : stepForward
}

var currentValue = -4

let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)

while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}

print("zero")
/*
    Closures
    Group code that executes together, without creating a named function
    Closures are self contained blocks of functionality that can be passed around and used in your code
*/

//Closure expression syntax has the following general form
/*
    { (<#parameters#>) -> <#return type#> in
    <#statements#>
    }
*/

let names: [String] = ["Chris", "Alex", "Ewa", "Barry", "Daniela"]

let reversedNames = names.sorted(by: {
    (s1: String, s2: String) -> Bool in 

    return s1 > s2
})

//alternatively

let reversedNamesShorter = names.sorted(by: {s1, s2 in return s1 > s2})

//If there is only one line then it can be return as such
let reversedNamesEvenShorter = names.sorted(by: {s1, s2 in s1 > s2})

//Shorthand Argument Names
//Swift automatically provides shorthand argument names to inline closures
// $0, $1, $2 and so on

let reversedNamesShorthand = names.sorted(by: { $0 > $1})

//Trailing closure
func someFunctionThatTakesAClosure(closure: () -> Void) {
    //function body goes here
}

//Calling a function without using a trailing closure
someFunctionThatTakesAClosure(closure:{

})

//Using a trailing closure
someFunctionThatTakesAClosure(){
    //trailing closure's body goes here
}
/*
    Subscripts
    Access the elements of a collection

    Classes, structures and enumerations can define subscripts,
    which are shortcuts for accessing the member elements of a collection, list or sequences.  
*/

//Subscript syntax
/*subscript(index: Int) -> Int {
    get {
        //Return an appropriate subscript value here
    }

    set(newValue) {
        //Perform a suitable setting action here
    }
}
*/

//For only readOnly computed properties
/*subscript(index: Int) -> Int {
    // Return an appropriate subscript value here
}
*/

struct TimesTable {
    let multiplier: Int

    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)

print("Six times three is \(threeTimesTable[6])")

//Subscript Options
//Subscripts can take any number of input parameters
//and these  input parameters can be of any type.
//Subscripts can also return a value of any type

struct Matrix {
    let rows: Int
    let columns: Int

    var grid: [Double]

    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }

    func indexIsValid(row: Int, column: Int) -> Bool{
        return row >= 0 && row < rows && column >= 0 && column < columns
    }

    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(rows * columns) + column]
        }

        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

//Type Subscripts
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune

    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}

let mars = Planet[4]
print(mars)
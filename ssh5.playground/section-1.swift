// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

struct Matrix {
    let rows: Int, columns: Int
    var grid: Double[]
    init (rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValidForRow(row, column:column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set{
            assert(indexIsValidForRow(row, column:column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}
var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 0] = 1
matrix[0, 1] = 2
matrix[1, 1] = 4
matrix[1, 0] = 3
var matrixs = matrix
//let someValue = matrix[2, 2]

class Vehicle {
     var numberOfWheels: Int
     var maxPassengers: Int
     func description() -> String {
        return "\(numberOfWheels) wheels; up to \(maxPassengers) passengers"
       }
     init() {
         numberOfWheels = 0
         maxPassengers = 1
      }
}
//let someVehicle = Vehicle()

class Bicycle: Vehicle {
    init() {
        super.init()
        numberOfWheels = 2
    }
}
let someBicycle = Bicycle()
let someVehicle = Vehicle()
println("Bicycle: \(someBicycle.description())")

class Car: Vehicle {
    var speed: Double = 0.0
    init() {
        super.init()
        maxPassengers = 5
        numberOfWheels = 4
    }
    override func description() -> String {
        return super.description() + ";" +  "traveling at \(speed) mph"
    }
}
let car = Car()
car.speed = 180
println("Car: \(car.description())\n")

class SpeedLimintedCar: Car {
    override var speed: Double {
    get {
        return super.speed
    }
    set {
        super.speed = min(newValue, 40.0)
    }
    }
}
let limintedCar = SpeedLimintedCar()
limintedCar.speed = 60.0
println("\(limintedCar.description())\n")

/*构造器 init */
struct Fahrenheit {
    var temperature: Double
    init(fromF fatheer: Double) {
        temperature = (fatheer - 32) / 1.8
}
}
var f = Fahrenheit(fromF: 200)
println("\(f.temperature)\n")

/*默认值设置*/
struct Fahrenheits {
    var temperature = 32.0
}


/*可选属性类型*/
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        println(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese."

/*值类型的代理构造器*/
struct Size{
    var width = 0.0, height = 0.0
}
struct Point{
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    init() { }
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
let basicRect = Rect()

let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width:5.0, height: 5.0))


class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
      convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
    var output = "\(quantity) x \(name.lowercaseString)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    println(item.description)
}

/*通过闭包和函数来设置属性的默认值*/
struct Checkerboard {
    let boardColors: Bool[] = {
        var temporaryBoard = Bool[]()
        var isBlack = false
        for i in 1...10 {
            for j in 1...10 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
        }()
    func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
        return boardColors[(row * 10) + column]
    }
}
let board = Checkerboard()
println(board.squareIsBlackAtRow(0, column: 1))
println(board.squareIsBlackAtRow(9, column: 9))

struct Bank {
    static var coinsInBank = 10_000
    static func vendCoins(var numberOfCoinsToVend: Int) -> Int {
        numberOfCoinsToVend = min(numberOfCoinsToVend, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
     static func receiveCoins(coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.vendCoins(coins)
    }
    func winCoins(coins: Int) {
        coinsInPurse += Bank.vendCoins(coins)
    }
    deinit {
        Bank.receiveCoins(coinsInPurse)
    }
}

var playerOne: Player? = Player(coins: 100)
println("A new player has joined the game with \(playerOne!.coinsInPurse) coins")

playerOne!.winCoins(2_000)
println("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
println("The bank now only has \(Bank.coinsInBank) coins left")

playerOne = nil
println("PlayerOne has left the game")
println("The bank now has \(Bank.coinsInBank) coins")
println("The bank now has \(Bank.coinsInBank) coins")
/* 结果不正确，没有反初始化 */


/*
class Person {
    let name: String
    init(name: String) {
        self.name = name
        println("\(name) is being initialized")
    }
    deinit {
        println("\(name) is being deinitialized")
    }
}
var reference1: Person?
var reference2: Person?
var reference3: Person?
reference1 = Person(name: "John Appleseed")
reference2 = reference1
reference3 = reference1
reference1 = nil
reference2 = nil
reference3 = nil
*/
/*变为nil时没有反初始化*/



class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { println("\(name) is being deinitialized") }
}
class Apartment {
    let number: Int
    init(number: Int) { self.number = number }
    weak var tenant: Person?
    deinit { println("Apartment #\(number) is being deinitialized") }
}
var john: Person?
var number73: Apartment?

john = Person(name: "John Appleseed")
number73 = Apartment(number: 73)

john!.apartment = number73
number73!.tenant = john
john = nil
number73 = nil
/*变为nil时没有反初始化*/































// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


protocol Container {
    typealias ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

struct IntStack: Container {
    // IntStack的原始实现
    var items = Int[]()
    mutating func push(item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // 遵循Container协议的实现
    typealias ItemType = Int
    mutating func append(item: Int) {
        self.push(item)
    }
    var count: Int {
    return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}
extension Array: Container {}

struct Stack<T>: Container {
    // original Stack<T> implementation
    var items = T[]()
    mutating func push(item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
    // conformance to the Container protocol
    mutating func append(item: T) {
        self.push(item)
    }
    var count: Int {
    return items.count
    }
    subscript(i: Int) -> T {
        return items[i]
    }
}


func allItemsMatch<
    C1: Container, C2: Container
    where C1.ItemType == C2.ItemType, C1.ItemType: Equatable>
    (someContainer: C1, anotherContainer: C2) -> Bool {
        
        // 检查两个Container的元素个数是否相同
        if someContainer.count != anotherContainer.count {
            return false
        }
        
        // 检查两个Container相应位置的元素彼此是否相等
        for i in 0..someContainer.count {
            if someContainer[i] != anotherContainer[i] {
                return false
            }
        }
        
        // 如果所有元素检查都相同则返回true
        return true
        
}


var stackOfStrings = Stack<String>()
stackOfStrings.push("1")
stackOfStrings.push("2")
stackOfStrings.push("3")

var arrayOfStrings = ["1", "2", "3"]

if allItemsMatch(stackOfStrings, arrayOfStrings) {
    println("All items match.")
} else {
    println("Not all items match.")
}



let initialBits: UInt8 = 0b1111
let invertedBits = ~initialBits

let shiftBits: UInt8 = 4   // 即二进制的00000100
shiftBits << 1             // 00001000
shiftBits << 2             // 00010000
shiftBits << 5             // 10000000
shiftBits << 6             // 00000000
shiftBits >> 2             // 00000001


struct Vector2D {
    var x = 0.0, y = 0.0
}




/*中置*/
@infix func + (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)



/*前置*/
@prefix func - (vector: Vector2D) -> Vector2D {
    return Vector2D(x: -vector.x, y: -vector.y)
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive


/*组合赋值*/
@assignment func += (inout left: Vector2D, right: Vector2D) {
    left = left + right
}
var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd


/*组合赋值*/
@prefix @assignment func ++ (inout vector: Vector2D) -> Vector2D {
    vector += Vector2D(x: 1.0, y: 1.0)
    return vector
}

var toIncrement = Vector2D(x: 3.0, y: 4.0)
let afterIncrement = ++toIncrement


@infix func != (left: Vector2D, right: Vector2D) -> Bool {
    return (left.x != right.x || left.y != right.y)
}

let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 1.0, y: 3.0)
if twoThree != anotherTwoThree {
    println("这两个向量是不相等的.")
}

/*自定义 +++ */
operator prefix +++ {}
@prefix @assignment func +++ (inout vector: Vector2D) -> Vector2D {
    vector += vector
    return vector
}
var twoThrees = Vector2D(x: 2.0, y: 3.0)
let afterDoubling = +++twoThrees


/*自定义 +- 
  增加结合性和优先级 */
operator infix +- { associativity left precedence 140 }
func +- (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y - right.y)
}
let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector



func simpleAssert(condition: @auto_closure () -> Bool, message: String){
    if !condition(){
        println(message)
    }
}
let testNumber = 5
simpleAssert(testNumber % 2 == 0, "testNumber isn't an even number.")





var a: Int[] = []
var a1: Int[][] = [[3, 56, 23], [23], [45,56,46], [45,46, 364]]
var a2: Int[][][] = [[[1,345,45], [3,56,5]], [[35,46],[45,56,45]]]
var a3: Int[][] = []
//a3.append([0,1])
a3
for _ in 0..3{
a3.append(Array(count:3, repeatedValue: 3))
}
a3


var optionalInteger: Optional<Int>
optionalInteger = nil
//optionalInteger!



/*func addTwoNumbers(a: Int)(b: Int) -> Int {
    return a + b
}
addTwoNumbers(4)(b: 5)
*/
func addTwoNumbers(a: Int, b: Int) -> Int {
    return a + b
}
addTwoNumbers(4,5)



func f(x: Int, y: String) -> String {
    return y + String(x)
}
f(7, "hello")


class C {
    func f(x: Int, y: String) -> String {
        return y + String(x)
    }
}
let c = C()
c.f(7,  y: "hello")



let points = [(0, 0), (1, 0), (1, 1), (2, 0), (2, 1)]
for point in points{
switch point{
case let(x,y) where y == 0 :
    println(point)
default:
    break
 }
}



func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)
//makeIncrementer(7)

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()
var inreturn15 = returnFifteen
inreturn15()



struct Matrix {
    let rows: Int, columns: Int
    var grid: Double[]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}
var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.5
matrix[1, 1] = 3.2
matrix







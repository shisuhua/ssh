// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


/*
class Person {
    var residence: Residence?
}
class Residence {
    var numberOfRooms = 1
}

let john = Person()
if let roomCount = john.residence?.numberOfRooms {
    println("John's residence has \(roomCount) room(s).")
} else {
    println("Unable to retrieve the number of rooms.")
}

john.residence = Residence()
if let roomCount = john.residence?.numberOfRooms {
    println("John's residence has \(roomCount) room(s).")
} else {
    println("Unable to retrieve the number of rooms.")
}
*/


/*为可选链定义模型类*/
class Person {
    var residence: Residence?
}
class Residence {
    var rooms = Room[]()
    var numberOfRooms: Int {
    return rooms.count
    }
    subscript(i: Int) -> Room {
        return rooms[i]
    }
    func printNumberOfRooms() {
        println("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}
class Room {
    let name: String
    init(name: String) { self.name = name }
}
class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName {
            return buildingName
        } else if buildingNumber {
            return buildingNumber
        } else {
            return nil
        }
    }
}
let john = Person()



func counter<Y: Address, U: Hashable>(){

}




func findStringIndex<T: Equatable>(array: T[], valueToFind: T) -> Int? {
    for (index, value) in enumerate(array) {
        if value == valueToFind{
            return index
        }
    }
    return nil
}
let strings = ["cat", "dog", "llama"]
if let foundIndex = findStringIndex(strings, "llama"){
    println("The index of llama is \(foundIndex)")
}





func swapTwoValues<T>(inout a: T, inout b: T) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someA = 45
var someB = 98
swapTwoValues(&someA, &someB)
println(someA)




struct Stack<T> {
    var items = T[]()
    mutating func push(item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}

























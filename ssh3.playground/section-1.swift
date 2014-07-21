// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

func abc(a: Int, b:Int,numbers: Double...) -> Double{
    var total:Double = 0
    for number in numbers {
        total += number
    }
    return
        total/Double(numbers.count) + Double(a) + Double(b)
}
abc(3,4,2,2)




func addTwoInts(a: Int,b: Int) -> Int{
   return a + b
}
//println("Result:\(addTwoInt(2,3))")
var ab : (Int, Int) -> Int = addTwoInts
println("Result:\(ab(2,3))")
var abcd = addTwoInts
println("Result:\(abcd(3,2))")


func st(input: Int) -> Int {
    return input + 1
}
func ts(input: Int) -> Int {
    return input - 1
}
func ch(ba: Bool) -> (Int) -> Int {
   return ba ? ts : st
}
var v = 3
let mo = ch(v > 0)
while v != 0{
    println(v)
    v = mo(v)
}




let names = ["C", "A", "a", "B", "D" ]
func backwards(s1: String, s2: String) -> Bool{
    return s1 > s2
}
var reversed = sort(names,backwards)
names.sort(>)


var re = sort(names,{ (s1: String, s2: String) -> Bool in
    return s1 > s2
    })
var r = sort(names,{ s1, s2 in
    return s1 > s2 })
var w = sort(names,{ s1, s2 in return s1 > s2 })
var rec = sort(names,{ s1, s2 in s1 > s2 })
var rev = sort(names, { $0 > $1 })

for name1 in names{
    print("\(name1) ")
}
println()

var ver = sort(names){ $0 > $1} //闭包
for name1 in names{
    print("\(name1) ")
}
println()


let digitNames = [0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
let strings = numbers.map {
(var number) -> String in
    var output = ""
    while number > 0 {
    output = digitNames[number % 10]! + output //字典不一定是有值的，所以是optional
    number /= 10
}
return output
}
for string in strings {
    print("\(string) ")
}



let name = [1,3,4,6]
func bac(s1: Int, s2: Int) -> Bool{
    return s1 > s2
}
var qwe = sort(name,bac)
//var qwe = name.sort(>)
for i  in name{
    print("\(i) ")
}
println()


enum CompassPoint: Int{
    case North = 1
    case South
    case East
    case West
}
var directionToHead = CompassPoint.West
directionToHead = .East

enum Barcode {
     case UPCA(Int, Int, Int)
     case QRCode(String)
}

println()
enum Plant: Int {
    case a = 1, b, c, d, e
    case a1 = 6,b1,c1,d1,e1
}
let f = Plant.c.toRaw()
println(f)
if let g = Plant.fromRaw(9){
//let g = Plant.fromRaw(9)
switch g {
    case .d:
    println("Bos")
    case .d1:
    println("Aos")
default:
    println("Not")
    }
}else{
   println("bucunzai")
}


























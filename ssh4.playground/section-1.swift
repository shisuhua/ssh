// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"
println(str)


struct Resolution{
    var width = 0
    var height = 0
}
class VideoMode{
    var resolution = Resolution() //被初始化为一个新的结构体实例
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

println("The width of someResolution is \(someResolution.width)")
//someVideoMode.resolution.width = 12880
println("The width of someVideoMode is \(someVideoMode.resolution.width)")
let vga = Resolution(width:604, height:480)
println("The width of someVideoMode is \(vga.width)")
var cinema = vga
cinema.width = 2048
let hd = Resolution(width:604, height:480)

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
println("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
if tenEighty === alsoTenEighty {
println("tenTighty and alsoTenEighty refer to the same Resolutioninstance.")
}

var ages = ["Peter": 23, "Wei": 35, "Anish": 65, "Katya": 19]
var copiedAges = ages
copiedAges["Peter"] = 24
println(ages["Peter"])

var a = [0,2,4,5,6]
var b = a
var c = a
b.unshare()
println(c[0])
a[0] = 234
//a.append(7)
println(a[0])
println(b[0])
println(c[0])

if c[0...1] === a[0...1]{
    println("have the same elements.")
}else{
    println("don't share the same elements.")
}

println()
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0,height = 0.0
}
struct Rect {
    var origin = Point()
    var size  = Size()
    var center: Point{
    get{
        let centerX = origin.x + (size.width / 2)
        let centerY = origin.y + (size.height / 2)
        return Point(x: centerX, y:centerY)
    }
    set(newCenter){
        origin.x = newCenter.x - (size.width / 2)
        origin.y = newCenter.y - (size.height / 2)
    }
    }
}
var square = Rect(origin: Point(x:0.0, y:0.0),size:Size(width:10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0,y: 15.0)
println("square.origin is now at (\(square.origin.x), \(square.origin.y))")

class StepCounter {
     var totalSteps: Int = 0 {
     willSet {
          println("About to set totalSteps to \(newValue)")
            }
     didSet {
        if  totalSteps > oldValue {
            totalSteps = 200
            println("Added \(totalSteps - oldValue) steps")
        }
    }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896

struct AudioChannel {
     static let thresholdLevel = 10
     static var maxInputLevelForAllChannels = 0
     var currentLevel: Int = 0 {
     didSet {
          if currentLevel > AudioChannel.thresholdLevel {
          currentLevel = AudioChannel.thresholdLevel
          }
         if currentLevel > AudioChannel.maxInputLevelForAllChannels {
             AudioChannel.maxInputLevelForAllChannels = currentLevel
        }
    }}}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

leftChannel.currentLevel = 7
println(leftChannel.currentLevel)
println(AudioChannel.maxInputLevelForAllChannels)

rightChannel.currentLevel = 11
println(rightChannel.currentLevel)
println(AudioChannel.maxInputLevelForAllChannels)


class Counter{
    var count = 0
    func increment() {          //实例方法
        count++
    }
    func increments(amount: Int) {
        count += amount
    }
    func reset() {
    count = 0
    }
}
let counter = Counter()        //初始值为0
counter.increment()
counter.increments(5)
counter.reset()


struct Points {
     var x = 0.0,y = 0.0
     mutating func moveByX(deltaX: Double,y deltaY: Double) {
       //x += deltaX
        //y += deltaY
        self = Points(x: x + deltaX, y: y + deltaY)
    }
}
var somePoint = Points(x: 1.0, y: 1.0)
//var somePoint = Points()
somePoint.moveByX(2.0, y:3.0)
println(somePoint.x)
//println(Points.x)

/*enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self{
        case Off:
            self = Low
        case Low:
            self = High
        case High:
            self = Off
        }
}
var ovenLight = TriStateSwitch.Low
ovenLight.next()
*/
/*自己打的报错，报错内容为：var ovenLight = TriStateSwitch.Low
  *下方为直接从资料上拷贝的，可以运行。。。
*/

enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case Off:
            self = Low
        case Low:
            self = High
        case High:
            self = Off
        }
    }
}
var ovenLight = TriStateSwitch.Low
ovenLight.next()
ovenLight.next()
















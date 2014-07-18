// Playground - noun: a place where people can play

import Cocoa

/*4.输入某年某月某日，判断这一天是这一年的第几天？ */

var someyear = 1900
var somemonth = 5
var someday = 4
var numberDay = 0
var n = 0
var monthdays:Array<Int> = [31,28,31,30,31,30,31,31,30,31,30,31]
if someyear%4 == 0 && someyear%100 != 0{
    monthdays[1] = 29
}
for i in 0..somemonth{
    if i == 0 {
        numberDay = someday
    }else {
        n = n + monthdays[i-1]
        numberDay = n + someday
    }
}
println("\(someyear)年\(somemonth)月\(someday)日是这一年的第\(numberDay)天")



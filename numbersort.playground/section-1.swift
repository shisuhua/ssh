// Playground - noun: a place where people can play

import Cocoa

/*随机生成1～10000不重复数共100个，并对这100个数快速排序，形成有序不重复数组*/

var array = Array<Int>()
var flag = 0
for i in 0..100{
    array.insert(Int(arc4random()%10000), atIndex:i)
}
do {
    flag = 0
    for i in 0..100{
        for j in (i + 1)..100{
            if array[i] == array [j]{
                flag = 1
                array[j] = Int(arc4random()%10000)
            }
        }
    }
}while flag == 1
array.sort(<)
for i in 0..100{
    if i%5 == 0{
        println()
    }
    print("\(array[i])  ")
}













































































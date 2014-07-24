// Playground - noun: a place where people can play

import Cocoa

func Yhsj(n: Int){
    var a = Array<Array<Int>>()
    for i in 1...n{
            a.append(Array(count:i, repeatedValue:0))
        }
    for i in 0...(n-1) {
        for j in 0...(n - i - 1) {
            print("  ")
        }
        for j in 0...i {
            if i == j || j == 0 {
               a[i][j] = 1
            }else{
               a[i][j] = a[i-1][j-1] + a[i-1][j]
            }
            if a[i][j] < 10 {
               print("   \(a[i][j])")
            }else if a[i][j] < 100{
               print("  \(a[i][j])")
            }else if a[i][j] < 1000{
               print(" \(a[i][j])")
            }else{
              print("\(a[i][j])")
            }
        }
        println()
    }
}
Yhsj(10)
println()
Yhsj(11)
println()











































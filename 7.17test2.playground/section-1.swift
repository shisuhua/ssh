// Playground - noun: a place where people can play

import Cocoa


/*2.青年歌手参加歌曲大奖赛，有10个评委打分，试编程求选手的平均得分（去掉一个最高分和一个最低分）。*/

var singerScore = Array<Int>()
for i in 0..10 {
    singerScore.insert(Int(arc4random()%100),atIndex:i)
}
println("各评委打分：")
for i in 0..10 {
    print("\(singerScore[i])  ")
}
println()
singerScore.sort(<)
singerScore.removeLast()
singerScore.removeAtIndex(0)
var sum:Int = 0
var count:Int = 0
for i in 0..8{
    sum = sum + singerScore[i]
    count++
}
var aver:Double = Double(sum)/Double(count)
print("选手平均成绩：\(aver)  ")




























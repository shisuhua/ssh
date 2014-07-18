// Playground - noun: a place where people can play

import Cocoa

/*5.猴子吃桃问题：猴子第一天摘下若干个桃子，当即吃了一半，还不瘾，又多吃了一个    第二天早上又将剩下的桃子吃掉一半，又多吃了一个。以后每天早上都吃了前一天剩下    的一半零一个。到第10天早上想再吃时，见只剩下一个桃子了。求第一天共摘了多少*/

var remainPeach = 1
var numberPeach: Int
var i = 1
for i in 1...10{
    remainPeach = 2 * (remainPeach + 1)
}
numberPeach = remainPeach
println("第一天摘了\(numberPeach)个桃子！")



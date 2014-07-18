// Playground - noun: a place where people can play

import Cocoa

/*  1.马克思手稿中有一道趣味数学题：有30个人，其中有男人、女人和小孩，在一家饭馆里吃饭
共花了50先令，每个男人各花3先令，每个女人各花2先令，每个小孩各花1先令，问男人、女人和小孩各有几人？*/


var menNumber:Int
var womenNumber:Int
var childrenNumber:Int
for menNumber in 1...28 {
    for womenNumber in 1...28{
        for childrenNumber in 1...28{
            if  menNumber + womenNumber + childrenNumber == 30 {
                if menNumber * 3 + womenNumber * 2 + childrenNumber == 50{
                    println("menNumber=\(menNumber)")
                    println("womenNumber=\(womenNumber)")
                    println("childrenNumber=\(childrenNumber)")
                    println()
                }
            }
        }
    }
}


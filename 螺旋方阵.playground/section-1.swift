// Playground - noun: a place where people can play

var board = Array<Array<Int>>()
for i in 0...6{
    board.append(Array(count:7,repeatedValue:-1))
}
var num = 1
var i = 0
var j = 0
var flag = 1 //向下
while true {
    if num > 49{ break }
    if board[i][j] == -1 {
        board[i][j] = num++
    }
    if flag == 1 {
        i++
        if i == 7 || board[i][j] != -1 {
            i--
            flag = 2 //向右
        }
    }
        else if flag == 2{
            j++
            if j == 7 || board[i][j] != -1 {
                j--
                flag = 3 //向上
            }
    }
            else if flag == 3 {
                i--
                if i == -1 || board[i][j] != -1 {
                    i++
                    flag = 4 //向左
                }
    }
                else {
                    j--
                    if j == -1 || board[i][j] != -1 {
                        j++
                        flag = 1
                    }
    }
}

for i in 0...6{
    for j in 0...6{
        if board[i][j] > 9 {
            print(board[i][j])
            print(" ")
        }else{
            print("0\(board[i][j])")
            print(" ")
        }
        
    }
    println()
}






















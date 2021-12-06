inputFile = open('./inputs/04.txt')
nums = inputFile.readline.split(",").map{ |x| x.strip}

rows = inputFile.readlines.map{ |x| x.strip}
rows.delete("")

rows = rows.map { |row| row.split(" ")}
rowsBin = rows.map {|row| row = [0]*5}

def checkWin(board)
    i = 0
    cols = board.transpose
    5.times do
        if board[i] == [1,1,1,1,1]
            return true
        end
        if cols[i] == [1,1,1,1,1]
            return true
        end
        i += 1
    end
    return false
end

def calculateScore(board, boardBin, num)
    i = 0
    sum = 0
    while i < board.length
        j = 0
        while j < board[i].length
            if boardBin[i][j] == 0
                sum += board[i][j].to_i
            end
            j += 1
        end
        i += 1
    end
    return sum * num.to_i
end

wins = 0
winList = [0]*(rows.length/5)
winHash = nums.map {|num| [num, 0]}.to_h

nums.each do |num|
    i = 0
    rows.each do |row|
        j = 0
        row.each do |x|
            if x.to_i == num.to_i
                rowsBin[i][j] = 1
            end
            j += 1
        end
        i += 1
    end
    k = 0
    while k < rows.length
        boardBin = rowsBin[k..k+4]
        if winList[k/5] == 0 && checkWin(boardBin)
            wins += 1
            winList[k/5] = wins
            winHash[num] = wins
        end
        k += 5
    end
    if wins >= winList.length
        p "BROKEN"
        break
    end
    p winList
end

p winList
p winHash

lastBoardIndex = winList.index(winList.max())*5
lastBoard = rows[lastBoardIndex..lastBoardIndex+4]
lastBoardBin = rowsBin[lastBoardIndex..lastBoardIndex+4]
winNum = winHash.key(winList.max()).to_i
p winNum
p lastBoardIndex
p lastBoard
p lastBoardBin
p calculateScore(lastBoard, lastBoardBin, winNum)
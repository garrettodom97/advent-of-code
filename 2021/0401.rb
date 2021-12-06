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
        if checkWin(boardBin)
            board = rows[k..k+4]
            p board
            p boardBin
            p calculateScore(board, boardBin, num)
            return
        end
        k += 5
    end
end



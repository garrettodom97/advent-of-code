inputFile = open('./inputs/06.txt')
fish = inputFile.readline.split(",").map{ |x| x.strip.to_i}

def nextDay(fish, depth, totalDays)
    if depth >= (totalDays)
        puts fish.length
        return
    end

    newFish = 0
    fish.each_with_index do |x, i|
        if x == 0
            fish[i] = 6
            newFish += 1
        else
            fish[i] -= 1
        end
    end
    newFish.times do
        fish << 8
    end
    nextDay(fish, depth + 1, totalDays)
end

nextDay(fish, 0, 80)
inputFile = open('./inputs/05.txt')
lines = inputFile.readlines.map{ |x| x.strip.split(" -> ").map{ |y| y.split(",")}}

sea = 1000.times.map{1000.times.map{0}}

danger_zones = 0
i = 0
while i < lines.length
    x1 = lines[i][0][0].to_i
    y1 = lines[i][0][1].to_i
    x2 = lines[i][1][0].to_i
    y2 = lines[i][1][1].to_i

    if x1 == x2
        j = [y1, y2].min
        k = [y1, y2].max
        while j <= k
            sea[j][x1] += 1
            if sea[j][x1] == 2
                danger_zones += 1
            end
            j += 1
        end
    elsif y1 == y2
        j = [x1, x2].min
        k = [x1, x2].max
        while j <= k
            sea[y1][j] += 1
            if sea[y1][j] == 2
                danger_zones += 1
            end
            j += 1
        end 
    end

    i += 1
end

p danger_zones
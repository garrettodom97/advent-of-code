inputFile = open('./inputs/01.txt')
depths = inputFile.readlines.map{ |x| x.strip.to_i}
count = 0
i = 0

while i < depths.length - 1
    if depths[i+1] > depths[i]
        count += 1
    end
    i += 1
end

p count
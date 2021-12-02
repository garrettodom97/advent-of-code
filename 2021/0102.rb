inputFile = open('./inputs/01.txt')
depths = inputFile.readlines.map{ |x| x.strip.to_i}
count = 0
i = 0

while i < depths.length - 3
    current_window = depths[i] + depths[i+1] + depths[i+2]
    next_window = depths[i+1] + depths[i+2] + depths[i+3]
    if next_window > current_window
        count += 1
    end
    i += 1
end

p count
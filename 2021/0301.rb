inputFile = open('./inputs/03.txt')
bins = inputFile.readlines.map{ |x| x.strip}

gamma = [0] * bins[0].length
epsilon = [0] * bins[0].length

list_count = 0
counts = [0] * bins[0].length

bins.each do |bin|
    pos = 0
    bin.split("").each do |bit|
        if bit.to_i == 1
            counts[pos] += 1
        end
        pos += 1
    end
    list_count += 1
end

p counts

pos = 0
counts.each do |count|
    if counts[pos].to_i >= bins.length / 2
        gamma[pos] = 1
    else
        epsilon[pos] = 1
    end
    pos += 1
end

p gamma
p epsilon

gamma_dec = 0
epsilon_dec = 0

pos = gamma.length - 1
gamma.each do |bit|
    gamma_dec += bit * 2**pos
    epsilon_dec += epsilon[epsilon.length - pos - 1] * 2**pos
    pos -= 1
end

p gamma_dec
p epsilon_dec
p epsilon_dec * gamma_dec


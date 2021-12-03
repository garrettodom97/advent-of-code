inputFile = open('./inputs/03.txt')
bins = inputFile.readlines.map{ |x| x.strip}

def filter(bins, pos, mode)
    if (bins.length == 1)
        return bins[0]
    else
        count = 0
        index = 0
        while index < bins.length
            bin = bins[index]
            if bin[pos].to_i == 1
                count += 1
            end
            index += 1
        end
        if mode == "oxygen"
            if count >= bins.length / 2.0
                keep = 1
            else
                keep = 0
            end
        elsif mode == "c02"
            if count < bins.length / 2.0
                keep = 1
            else
                keep = 0
            end
        end
        bins = bins.select {|bin| bin[pos].to_i == keep}
        return filter(bins, pos + 1, mode)
    end
end

oxygen = filter(bins, 0, "oxygen")
c02 = filter(bins, 0, "c02")

oxygen_dec = 0
pos = oxygen.length - 1
oxygen.split("").each do |bit|
    oxygen_dec += bit.to_i * 2**pos
    pos -= 1
end

c02_dec = 0
pos = c02.length - 1
c02.split("").each do |bit|
    c02_dec += bit.to_i * 2**pos
    pos -= 1
end

p oxygen_dec
p c02_dec
p oxygen_dec * c02_dec
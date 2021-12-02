inputFile = open('./inputs/02.txt')
commands = inputFile.readlines.map{ |x| x.strip}
h = 0
d = 0
aim = 0

commands.each do |command|
    if command[0] == 'f'
        h += command[-1].to_i
        d += command[-1].to_i * aim
    elsif command[0] == 'd'
        aim += command[-1].to_i
    else
        aim -= command[-1].to_i
    end
end

p h
p d
p h*d
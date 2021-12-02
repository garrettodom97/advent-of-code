inputFile = open('./inputs/02.txt')
commands = inputFile.readlines.map{ |x| x.strip}
h = 0
d = 0

commands.each do |command|
    if command[0] == 'f'
        h += command[-1].to_i
    elsif command[0] == 'd'
        d += command[-1].to_i
    else
        d -= command[-1].to_i
    end
end

p h
p d
p h*d
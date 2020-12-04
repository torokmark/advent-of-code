
lines = File.readlines('input').map { |line| line.strip }

width = lines.first.size

count = 0
down, right = 1, 3
loop do
    p "#{count} #{lines[down][right % width]}"
    count += 1 if lines[down][right % width] == '#' 
    down += 1
    right += 3
    break if down >= lines.size 
end

p count

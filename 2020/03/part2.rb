
lines = File.readlines('input').map { |line| line.strip }

width = lines.first.size

steps = [
  { right: 1, down: 1, count: 0},
  { right: 3, down: 1, count: 0},
  { right: 5, down: 1, count: 0},
  { right: 7, down: 1, count: 0},
  { right: 1, down: 2, count: 0},
]

steps.each do |step|
  down = 0 
  right = 0 
  count = 0
  loop do
      p "#{count} #{lines[down][right % width]}"
      count += 1 if lines[down][right % width] == '#' 
      down += step[:down]
      right += step[:right]
      break if down >= lines.size 
  end
  step[:count] = count
end

p steps.map { |step| step[:count] }.inject(:*)

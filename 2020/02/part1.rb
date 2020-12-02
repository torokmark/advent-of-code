

lines = File.readlines('input').map { |line| line.strip }

db = []
lines.each do |line|
  parts = line.split
  range = parts[0].split('-').map(&:to_i)
  db << { cond: Range.new(range[0], range[1]), inst: parts[1][0..-1], passw: parts[2] }
end

count = 0
db.each do |val|
  count += 1 if val[:cond].include?(val[:passw].count(val[:inst]))
end

p count

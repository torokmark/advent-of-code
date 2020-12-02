

lines = File.readlines('input').map { |line| line.strip }

db = []
lines.each do |line|
  parts = line.split
  db << { cond: parts[0].split('-').map(&:to_i), inst: parts[1][0..-2], passw: parts[2] }
end

count = 0
db.each do |val|
  count += 1 if (val[:passw][val[:cond][0] - 1] == val[:inst]) ^ (val[:passw][val[:cond][1] - 1] == val[:inst])
  # p val
  # p "#{val[:passw][val[:cond][0] - 1]} #{val[:inst]}"
  # p (val[:passw][val[:cond][0] - 1] == val[:inst]) # ^ (val[:passw][val[:cond][1]] == val[:inst])
end

p count

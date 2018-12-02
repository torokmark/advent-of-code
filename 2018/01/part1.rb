current = 0

File.readlines('day01.input').each do |frequency|
  current += frequency.to_i
end

p current


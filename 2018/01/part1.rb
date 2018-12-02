current = 0

File.readlines('input').each do |frequency|
  current += frequency.to_i
end

p current


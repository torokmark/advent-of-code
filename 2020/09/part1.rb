
numbers = File.readlines('input').map { |e| e.strip.to_i }

delt = 25

# 552655238

(delt..numbers.size - 1).each do |i|
  p numbers[i] if not numbers[i-delt..i-1].any? { |e| numbers[i-delt..i-1].include?(numbers[i] - e) }
end



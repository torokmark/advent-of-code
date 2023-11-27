
nums = File.read('input.txt').split.map { |x| x.to_i }

p nums.map { |n| (n / 3) - 2 }.sum
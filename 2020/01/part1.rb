

nums = File.read('input.txt').split.map { |x| x.to_i }

p nums

nums.each_with_index do |value, idx|
  idx.upto(nums.length - 1) do |i|
    p "#{value}*#{nums[i]} == #{value * nums[i]}" if value + nums[i] == 2020
  end
end

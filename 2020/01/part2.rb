

nums = File.read('input.txt').split.map { |x| x.to_i }

p nums

nums.each_with_index do |value, idx|
  idx.upto(nums.length - 1) do |i|
    i.upto(nums.length - 1) do |j|
      p "#{value}*#{nums[i]}*#{nums[j]} == #{value * nums[i] * nums[j]}" if value + nums[i] + nums[j] == 2020
    end
  end
end

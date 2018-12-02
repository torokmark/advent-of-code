current = 0
frequencies = [] << current

curr_freqs = File.readlines('day01.input').map { |x| x.to_i }

curr_freqs.cycle do |freq|
  current += freq
  frequencies << current
  return current if frequencies.uniq.length != frequencies.length
end

p current 

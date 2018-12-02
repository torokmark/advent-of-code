
ids = File.readlines('input')

arr = []

ids.each do |id|
  hash = Hash.new(0)
  id.strip.split('').each{ |key| hash[key] += 1 }
  arr.concat hash.select { |key, value| value == 2 || value == 3 }.values.uniq
end

hsh = arr.each_with_object(Hash.new(0)) { |element,counts| counts[element] += 1 }
p "#{ hsh[3] } x #{ hsh[2] } == #{ hsh[2] * hsh[3] }"

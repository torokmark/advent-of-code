
jolts = File.readlines('input').map(&:to_i).sort

variants = [1] + [0] * jolts.max

jolts.each do |e|
  variants[e] = variants[e-1] + variants[e-2] + variants[e-3]
end
  
p variants.last


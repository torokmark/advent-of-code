
regexs = []
base_units = ('a'..'z')
base_units.each { |x|
  regexs << x + x.upcase
}.reverse_each { |x|
  regexs << x.upcase + x
}

polymer = File.readlines('input').first.strip

# Part 1

def include?(str, regexs)
  regexs.each do |x|
    return true if str.include?(x)
  end
  false
end

while include?(polymer, regexs)
  regexs.each { |x|
    polymer.sub!(x, '')
  }
end

p polymer.size

# Part 2

produced = Hash.new(0)

base_units.each do |unit|
  mod_poly = polymer.gsub(/#{unit}|#{unit.upcase}/, '')
  while include?(mod_poly, regexs)
    regexs.each { |x|
      mod_poly.sub!(x, '')
    }
  end
  produced[unit] = mod_poly.size
end

produced.each { |x| p x }

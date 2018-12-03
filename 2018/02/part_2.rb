ids = File.readlines('input').map { |line| line.strip }

a = ids[1].bytes
b = ids[4].bytes

class String
  def xor_with(other_string)
    self.bytes.zip(other_string.bytes).map { |a, b|  a ^ b}.pack('c*')
  end
end

ids.each do |id|
  arr = ids.map { |l| 
    l.xor_with(id)
      .bytes
      .each_with_object(Hash.new(0)) { |word, counts| 
        counts[word] += 1 
      } 
  }.select { |h| 
    h.values.count == 2 
  }.select { |h|
    h.has_value?(1)
  }
  p "#{ id } #{ arr }" if not arr.empty?
end

















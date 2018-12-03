ids = File.readlines('input').map { |line| line.strip }

class String
  def xor_with(other_string)
    self.bytes.zip(other_string.bytes).map { |a, b|  a ^ b}.pack('c*')
  end
end

ids.each do |id|
  arr = ids.map { |l|  # map values to xored 
    l.xor_with(id)     # xor the two strings
      .bytes           # convert the xored results to bytes
      .each_with_object(Hash.new(0)) { |word, counts|   
        counts[word] += 1     # counts the frequency of each
      } 
  }.select { |h| 
    h.values.count == 2  # select just those which contains only two different pairs
  }.select { |h|
    h.has_value?(1)   # select those where one of them is one (one distance far, the other one is '0' => something)
  }
  p "#{ id } #{ arr }" if not arr.empty?
end

















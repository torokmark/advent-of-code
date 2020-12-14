
lines = File.readlines('sample')

ids = lines.last
        .split(',')
        .each_with_index
        .map { |e, idx| [e.strip, idx] }
        .reject { |e| e.first == 'x' }
        .map { |e| e.map(&:to_i) }


p ids
p ids.sort.reverse



=begin
multi = lines.first.to_i / ids.first.last
#multi = 100_000_000_000_000 / ids.first.last
start = ids.first.last * (multi + 1)
p start
p ids

def all_fits?(ids, start)
  ids[1..].each do |id|
    return false if (start + id.first) % id.last != 0
  end
  true
end

while not all_fits?(ids, start)
  start += ids.first.last
end
p start
=end



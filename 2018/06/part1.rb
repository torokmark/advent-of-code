require 'set'

coords = File
          .readlines('input')
          .map { |line| line.split(',')
                            .map(&:to_i) }

width = coords.max_by { |e| e.last }.last
height = coords.max_by { |e| e.first }.first

def man(c1, c2)
  (c1.first - c2.first).abs + (c1.last - c2.last).abs
end

def closest(coords, coord)
  m = coords
        .map { |c| man(c, coord) }
        .min
  coords.find_all { |c| man(c, coord) == m }
end

#p closest(coords, [0, 4])
#p closest(coords, [0, 0])

skip = [].to_set 
map = []
size = [width, height].max
(0..size).each do |col|
  map << []
  (0..size).each do |row|
    c = closest(coords, [row, col])
    map.last << c
    if ([0, size].include?(row) or [0, size].include?(col))
      skip << c if c.size == 1
    end
  end
end

good = coords - skip.to_a.map { |e| e.first }

#p good

area = []
map.each do |row|
  row.each do |col|
    area << col if col.size == 1 && good.include?(col.first) 
  end
end

#p area.group_by { |e| e.first }.each { |k, v| [k, v.first.size] }.to_h
p area.group_by { |e| e.first }.map { |k, v| [k, v.size] }.to_h.values.max


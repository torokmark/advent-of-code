
$coords = File.readlines('input2').map { |x| x.strip.split(',').map(&:to_i) }

def calc_distance(c1, c2)
  (c1.first - c2.first).abs + (c1.last - c2.last).abs
end

def closes_coord(coord)
  $coords.map { |x| [coord, x, calc_distance(coord, x)] }.group_by { |coord, x, dist| dist }.min_by { |x| x.last }.last
end

height = $coords.map(&:first).max
width = $coords.map(&:last).max

hcoords = Hash.new
$coords.each_with_index do |coord, idx|
  hcoords[coord] = "C#{ idx }"
end

matrix = [['xx'] * (width + 1) ] * (height + 1)

(0..width).each do |i|
  (0..height).each do |j|
    closest = closes_coord([j, i])
    if closest.size > 1
      p "size > 1 #{ closest } #{ j } #{ i }"
      #matrix[j][i] = '--'
    elsif closest.size == 1
      p "size == 1 #{ closest } #{ j } #{ i }"
      #matrix[j][i] = hcoords[closest[0][1]]
    end
  end
end

(0..width).each do |i|
  (0..height).each do |j|
    print "#{ matrix[j][i] }  "
  end
  puts "\n"  
end


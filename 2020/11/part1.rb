
seats = File.readlines('sample').map { |line| line.strip }


def any_occupied?(seats, row, col)
  (-1..1).each do |r|
    (-1..1).each do |c|
      if (0..seats.size-1).include?(row + r) && (0..seats.first.size-1).include?(col + c)
        if '#' == seats[row + r][col + c]
          return true 
        end
      end
    end
  end
  false
end

def num_of_empty?(seats, row, col)
  num_of_empty = 0
  (-1..1).each do |r|
    (-1..1).each do |c|
      if (0..seats.size-1).include?(row + r) && (0..seats.first.size-1).include?(col + c)
        num_of_empty += 1 if 'L' == seats[row + r][col + c]
      end
    end
  end
  num_of_empty
end

def change(seats)
  new_seats = seats.map(&:clone)
  0.upto(seats.size - 1) do |row|
    0.upto(seats.first.size - 1) do |col|
      if 'L' == seats[row][col] && !any_occupied?(seats, row, col)
        new_seats[row][col] = '#' 
      elsif '#' == seats[row][col] && 4 <= num_of_empty?(seats, row, col)
        new_seats[row][col] = 'L'
      elsif '.' == seats[row][col]
        new_seats[row][col] = '.'
      end
    end
  end
  new_seats
end

#p occupied?(seats, 2, 3)
#p four_and_more_empty?(seats, 1, 1)

=begin
seats.each do |line|
  p line
end
p '==================='
new_seats = change(seats)
new_seats.each do |line|
  p line
end
p "===================="
seats.each do |line|
  p line
end
=end
new_seats = seats.map(&:clone)

loop do 
  seats = new_seats
  new_seats = change(seats)
  p '1'
  break if seats.eql? new_seats
end

new_seats.each do |line|
  p line
end


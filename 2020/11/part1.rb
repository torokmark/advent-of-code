
seats = File.readlines('input').map { |line| line.strip }

def pr(new_seats)
  new_seats.each do |line|
    p line
  end
end


def any_occupied?(seats, row, col)
  idxs = [-1, 0, 1].product([-1, 0, 1])
  idxs.delete([0, 0])
  idxs.each do |pair|
    if (0..seats.size-1).include?(row + pair.first) && (0..seats.first.size-1).include?(col + pair.last)
      return true if '#' == seats[row + pair.first][col + pair.last]
    end
  end
  false
end

def num_of_occupied(seats, row, col)
  num_of_empty = 0
  idxs = [-1, 0, 1].product([-1, 0, 1])
  idxs.delete([0, 0])
  idxs.each do |pair|
    if (0..seats.size-1).include?(row + pair.first) && (0..seats.first.size-1).include?(col + pair.last)
      num_of_empty += 1 if '#' == seats[row + pair.first][col + pair.last] 
    end
  end
  num_of_empty
end

def all_occupied(seats)
  occupied = 0
  seats.each do |row|
    occupied += row.chars.count { |col| col == '#' }
  end
  occupied
end

def change(seats)
  new_seats = seats.map(&:clone)
  0.upto(seats.size - 1) do |row|
    0.upto(seats.first.size - 1) do |col|
      if 'L' == seats[row][col] 
        if !any_occupied?(seats, row, col)
          new_seats[row][col] = '#' 
        else
          new_seats[row][col] = 'L'
        end
      elsif '#' == seats[row][col] 
        if 4 <= num_of_occupied(seats, row, col)
          new_seats[row][col] = 'L'
        else
          new_seats[row][col] = '#'
        end
      elsif '.' == seats[row][col]
        new_seats[row][col] = '.'
      end
    end
  end
  new_seats
end

new_seats = seats.map(&:clone)

new_seats = change(new_seats)

loop do
  seats = new_seats
  new_seats = change(seats)
  break if new_seats == seats
end

pr new_seats
p all_occupied(new_seats)

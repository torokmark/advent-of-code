
lines = File.readlines('input').map { |line| line.strip }

#lines = ["FBFBBFFRLR"]
lines.reject! { |line| line.start_with?('FFFFFFF') && line.start_with?('BBBBBBB') }

ids = []
lines.each do |line|
  row = line[0..6]
    .chars
    .each_with_index
    .reduce([0, 127]) { |r, e| e.first == "F" ? r[1] -= 2**(6-e.last) : r[0] += 2**(6-e.last); r }
    .first

  col = line[7..9]
    .chars
    .each_with_index
    .reduce([0, 7]) { |c, e| e.first == "L" ? c[1] -= 2**(2-e.last) : c[0] += 2**(2-e.last); c }
    .first
  
  ids << row * 8 + col

end

p ids.sort.each_cons(2).find_all { |e| e.last - e.first > 1}

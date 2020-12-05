
lines = File.readlines('input').map { |line| line.strip }

#lines = ["FBFBBFFRLR"]

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
=begin
  row = [0, 127]
  line[0..6].chars.each_with_index do |e, idx|
    if e == "F"
      row[1] -= 2**(6-idx)
    elsif e == "B"
      row[0] += 2**(6-idx) 
    end
    #p "#{line[0..6]} #{row} #{e} #{idx}"
  end
  col = [0, 7] 
  line[7..9].chars.each_with_index do |e, idx|
    if e == "L"
      col[1] -= 2**(2-idx)
    elsif e == "R"
      col[0] += 2**(2-idx)
    end
  end
  ids << row.first * 8 + col.first
=end
end
p ids.max

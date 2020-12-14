
lines = File.readlines('input')

timestamp = lines.first.to_i
ids = lines.last.split(',').reject { |id| id == 'x' }.map(&:to_i)

earliest = ids.map { |id| 
  multi = timestamp / id
  multi = (multi + 1) * id - timestamp
  [id, multi]
}.min { |a, b|
  a.last <=> b.last
}

p earliest.inject(&:*)

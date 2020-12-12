
jolts = File.readlines('input').map(&:to_i)


jolts += [0, jolts.max + 3]

h = jolts.sort
  .each_cons(2)
  .map { |e| e.last - e.first }
  .tally

p h[1] * h[3]

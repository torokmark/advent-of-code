#!/usr/bin/exec ruby

file  = File.open("input.txt")
lines = file.read.split("\n")


def scenic_score(row, col, forrest)
  left = forrest[row][0..col - 1].rindex { |e| e >= forrest[row][col] }
  right  = forrest[row][col + 1..forrest.first.size - 1].index { |e| e >= forrest[row][col] }

  visibles = []
  visibles << (left.nil? ? col : col - left)
  visibles << (right.nil? ? forrest.first.size - 1 - col : right + 1)

  cnt = 0
  for i in (0..row - 1).to_a.reverse do
    cnt += 1
    break if forrest[row][col] <= forrest[i][col]
  end
  visibles << cnt
  cnt = 0
  for i in (row + 1..forrest.size - 1).to_a do
    cnt += 1
    break if forrest[row][col] <= forrest[i][col]
  end
  visibles << cnt
end


def solve(lines)
  forrest = lines.map { |line| line.chars.map(&:to_i) }

  #scenic_score(2, 1, forrest)

  max = 0
  1.upto(forrest.size - 2) do |i|
    1.upto(forrest.first.size - 2) do |j|
      curr = scenic_score(i, j, forrest).inject(1, :*)
      #p "#{i} #{j} #{curr}"
      if max < curr
        max = curr
      end
    end
  end
  max
end

p solve(lines)





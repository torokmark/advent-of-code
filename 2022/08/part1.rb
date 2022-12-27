#!/usr/bin/exec ruby

file  = File.open("input.txt")
lines = file.read.split("\n")

def visible?(row, col, forrest)
  return true if ([row, col] & [0, forrest.size - 1, forrest.first.size - 1]).any?
  directions = []
  directions << (0..col - 1)
                  .select { |i| forrest[row][i] >= forrest[row][col] }
                  .map { |i| forrest[row][i] }
  directions << (col + 1..forrest[row].size - 1)
                  .select { |i| forrest[row][i] >= forrest[row][col] }
                  .map { |i| forrest[row][i] }
  directions << (0..row -1)
                  .select { |i| forrest[i][col] >= forrest[row][col] }
                  .map { |i| forrest[i][col] }
  directions << (row + 1..forrest.size - 1)
                  .select { |i| forrest[i][col] >= forrest[row][col] }
                  .map { |i| forrest[i][col] }
  directions.any? { |e| e.empty? }
end


def count_trees(forrest)
  res = 0
  forrest
    .each_with_index { |row, i| 
      res += row
        .each_with_index
        .select { |field, j| visible?(i, j, forrest) }
        .count
    }.first
  res
end


def solve(lines)
  forrest = lines.map { |line| line.chars.map(&:to_i) }
  count_trees(forrest)
end

p solve(lines)


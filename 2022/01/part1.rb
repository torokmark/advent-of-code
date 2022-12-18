#!/usr/bin/exec ruby

def solve(path)
  file = File.open(path)
  p file.read.split("\n\n")
    .map { |group| group.split("\n") }
    .map { |group| group.map(&:to_i).sum }
    .max
  file.close
end


solve("input.txt")

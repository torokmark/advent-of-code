#!/usr/bin/exec ruby

def solve(lines)
  lines
    .map { |line| 
      [line[..line.size/2 - 1], line[-line.size/2..]]  
    }
    .map { |comp|
      comp.first.chars.intersection(comp.last.chars).first
    }.map { |char|
      char.downcase == char ? char.ord - 96 : char.ord - 38
    }.sum
end

file = File.open("input.txt")
lines = file.read.split("\n")

p solve(lines)

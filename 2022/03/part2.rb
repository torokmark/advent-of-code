#!/usr/bin/exec ruby

def solve(lines)
  lines
    .each_slice(3)
    .to_a
    .map { |chunk| chunk[0]
                      .chars
                      .intersection(
                        chunk[1]
                          .chars
                          .intersection(chunk[2].chars)).first
    }
    .map { |char| 
      char.downcase == char ? char.ord - 96 : char.ord - 38 
    }
    .sum
end

file = File.open("input.txt")
lines = file.read.split("\n")

p solve(lines)

#!/usr/bin/exec ruby

def solve(lines)
  lines
    .map { |line| line.split(",") }
    .map { |line| [line.first.split("-").map(&:to_i), line.last.split("-").map(&:to_i)] }
    .map { |line| [Range.new(line.first[0], line.first[1]), Range.new(line.last[0], line.last[1])] }
    .map { |line| line.first.to_a & line.last.to_a }
    .select { |e| !e.empty? }
    .count
end

file = File.open("input.txt")
lines = file.read.split("\n")

p solve(lines)

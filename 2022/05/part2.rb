#!/usr/bin/exec ruby

file   = File.open("input.txt")
blocks = file.read.split("\n\n")

def parse_crates(crates)
  ncol = crates.last.chars.max.to_i
  storage = Array.new(ncol) { Array.new }
  crates
    .take(crates.size - 1)
    .reverse
    .map { |item| ret = ""; ncol.times { |i| ret << item.chars[1 + i*4] }; ret }
    .each { |item| item.chars.each_with_index { |e, i| storage[i] << e if !e.strip.empty? } }
  storage
end

def parse_moves(moves)
  steps = []
  moves
    .map { |move| move.split(" ").map(&:to_i) }
    .map { |move| {from: move[3], to: move[5], top: move[1]} }
end

def solve(crates, moves)
  moves.each do |move|
    #p "--> #{crates}"
    #p "--> #{move}, #{crates[move[:from] - 1][-(move[:top])..]}"
    crates[move[:to] - 1].push(crates[move[:from] - 1][-move[:top]..]).flatten!
    crates[move[:from] - 1] = crates[move[:from] - 1][..-move[:top] - 1]
    #p "   -> #{crates}"
  end
  crates.map { |crate| crate.last }.join
end

crates = parse_crates(blocks.first.split("\n"))
moves  = parse_moves(blocks.last.split("\n"))
p solve(crates, moves)

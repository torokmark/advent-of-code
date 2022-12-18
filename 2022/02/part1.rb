#!/usr/bin/exec ruby

MAP = { A: :rock, B: :paper, C: :scissor, X: :rock, Y: :paper, Z: :scissor }
MY = { rock: {weight: 1, beat: :scissor}, paper: {weight: 2, beat: :rock}, scissor: {weight: 3, beat: :paper} }

=begin
A X => 1 + 3
A Z => 3
A Z => 3
A X => 1 + 3
A X => 1 + 3
B X => 1
C Y => 2 
B Z => 3 + 6
A Z => 3 
A X => 1 + 3
A Y => 2 + 6
=end

def solve(path)
  file = File.open(path)
  p file.read.split("\n")
      .map { |round| round.strip.split(" ") }
      .map { |round|
        me  =  MAP[round[1].to_sym]
        you =  MAP[round[0].to_sym]
        res =  MY[me][:weight]
        res += me == you ? 3 : MY[me][:beat] == you ? 6 : 0
      }
      .sum
  file.close
end


solve("input.txt")

#!/usr/bin/exec ruby

MAP    = { A: { name: :rock,
                draw: :rock,
                win:  :paper,
                lose: :scissors },
           B: { name: :paper,
                draw: :paper,
                win:  :scissors,
                lose: :rock },
           C: { name: :scissors,
                draw: :scissors,
                win:  :rock,
                lose: :paper }}

RESULT  = { X: :lose, Y: :draw, Z: :win }
WEIGHTS = { rock: 1, paper: 2, scissors: 3 }

=begin
A Y => 1 + 3
B X => 1 + 0
C Z => 1 + 6

---

A X => 3 + 0
A Z => 2 + 6
A Z => 2 + 6
A X => 3 + 0
A X => 3 + 0
B X => 1 + 0
C Y => 3 + 3
B Z => 3 + 6
A Z => 2 + 6
A X => 3 + 0
A Y => 1 + 3
=end

def solve(path)
  file = File.open(path)
  p file.read.split("\n")
      .map { |round| round.strip.split(" ") }
      .map { |round|
        yours  = MAP[round[0].to_sym]
        res    = RESULT[round[1].to_sym]
        ret    = res == :draw ? 3 : res == :win ? 6 : 0
        mine   = yours[res]
        ret   += WEIGHTS[mine]
      }
      .sum
  file.close
end


solve("input.txt")

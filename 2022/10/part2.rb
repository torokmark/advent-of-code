#!/usr/bin/exec ruby

file  = File.open("input.txt")
lines = file.read.split("\n")


def solve(lines)
  pos = 1
  crt = 0
  lines.each do |line|
    cmd = line.split
    if cmd.first == "addx"
      crt += 1
      print (pos..pos + 2).to_a.include?(crt % 40) ? "#" : "."
      puts if crt % 40 == 0
      crt += 1  
      print (pos..pos + 2).to_a.include?(crt % 40) ? "#" : "."
      puts if crt % 40 == 0
      pos += cmd.last.to_i
    elsif cmd.first == "noop"
      crt += 1
      print (pos..pos + 2).to_a.include?(crt % 40) ? "#" : "."
      puts if crt % 40 == 0
    end
  end
end

solve(lines)

#!/usr/bin/exec ruby

file  = File.open("input.txt")
lines = file.read.split("\n")


def solve(lines)
  results = []
  [20, 60, 100, 140, 180, 220].each do |cycle|
    register = 1
    cnt = 0
    cmds = lines.clone
    loop do
      cmd, val = cmds.shift.split
      p "~~> `#{cmd}` `#{val}`"
      if cmd == "addx"
        cnt += 2
        break if cnt >= cycle
        register += val.to_i
      elsif cmd == "noop"
        cnt += 1
        break if cnt >= cycle
      end
      p "#{cnt} #{register}"
    end
    results << register * cycle
  end
  results.sum
end

p solve(lines)


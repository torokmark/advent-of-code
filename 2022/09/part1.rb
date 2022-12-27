#!/usr/bin/exec ruby

file  = File.open("sample01.txt")
lines = file.read.split("\n")
          .map { |line| line.split }
          .map { |line| [line.first, line.last.to_i]}

# ==============
# Not finished!

def init_table(lines)
  width = lines
    .select { |line| ["R", "L"].include?(line.first) }
    .map(&:last)
    .sum
  height = lines
    .select { |line| ["D", "U"].include?(line.first) }
    .map(&:last)
    .sum
end

#p init_table(lines)


def solve(lines)
  tail = head = [0, 0]
  lines.each do |line|
    case line.first
    when "R"
      #
    when "L"
  end
end

p solve(lines)


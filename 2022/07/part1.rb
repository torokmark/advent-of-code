#!/usr/bin/exec ruby

file  = File.open("sample02.txt")
lines = file.read.split("\n")

# ==============
# Not finished!

# This does not work if `ls` is executed 
# multiple times on the same dir

def parse_lines(lines)
  # https://ruby-doc.org/3.1.2/Hash.html#class-Hash-label-Default+Proc
  tree = Hash.new { |hash, key| hash[key] = [] }
  cur = []
  lines.each do |line|
    case line.split
    in ["$", "cd", ".."]
      cur.pop
    in ["$", "cd", /[\w\/]/ => dir]
      cur << dir
    in [/\d+/ => size, filename]
      tree[cur.join] << size.to_i
    else
    end
  end
  tree
end

def merge_up(tree)
  result = {}
  tree
    .sort_by { |k, v| k.size }
    .reverse
    .each { |k, v| 
      result[k] = tree
        .select { |ke, va| ke.start_with?(k) }
        .values
#        .flatten
#        .sum
      p result
    }
    .to_h
  result
end

def solve(tree)
  tree
    .select { |key, value| value <= 100000 }
    .map { |key, value| value }
    .sum
end




tree = parse_lines(lines)
tree = merge_up(tree)

p tree

#p solve(tree)


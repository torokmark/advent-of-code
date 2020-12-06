
groups = File.read('input').split("\n\n")

p groups.map { |group| group.gsub("\n", "").chars.uniq.size }.sum

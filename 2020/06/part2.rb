
groups = File.read('input').split("\n\n")

p groups.map { |group| group.split("\n") }
        .map { |group| group.map { |e| e.chars } }
        .map { |group| group.reduce(:&).size }
        .sum

=begin
groups.map! { |group| group.split("\n") }

groups.map! { |group| group.map { |e| e.chars } }

p groups.map { |group| group.reduce(:&).size }.sum
=end


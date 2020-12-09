
lines = File.read('input').split("\n")

$tree = {}
lines.each do |line|
  parent = line.scan(/^([a-z\s]*) bags contain/).first.first
  children = line.scan(/[1-9] ([a-z]* [a-z]*) bag/).map { |e| e.first }
  $tree[parent] = children
end



$all = []

def parents(child)
  parents = []
  $tree.keys.each do |n|
    if $tree[n].include?(child)
      parents << n
    end
  end
  #p "child: #{child} parents: #{parents}"
  parents
end


def traverse(children)
  #p "children #{children}"
  return if children.empty?
   
  curr_par = []
  children.each do |child|
    curr_par.push(*parents(child))
    $all.push(*curr_par).uniq!
    #p "curr par: #{curr_par} all: #{$all}"
  end

  traverse(curr_par)
end



traverse(['shiny gold'])

p "#{$all.uniq.size}"


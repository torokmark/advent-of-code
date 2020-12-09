
lines = File.read('input').split("\n")

$tree = {}
lines.each do |line|
  parent = line.scan(/^([a-z\s]*) bags contain/).first.first
  children = line.scan(/([1-9]+) ([a-z]* [a-z]*) bag/).map { |e| {num: e.first.to_i, col: e.last} }
  $tree[parent] = children
end



$count = 0
=begin
def traverse(parent)
  if $tree[parent[:col]].empty? 
    return parent[:num]
  end
  
  ret = []
  $tree[parent[:col]].each do |child|
    p child
    ret << traverse(child)
  end
  $count += parent[:num]
  val = ret.reduce(:+) * parent[:num]
  $count += val
  val
end
=end

def traverse(children)
  p "==> #{children}"
  return 0 if children.empty?
  sum = 0
  children.each do |child|
    p "!! #{child}"
    val = traverse($tree[child[:col]])
    sum += child[:num] + child[:num] * val
    p "~~> #{child} #{val} #{sum}"
  end
  sum
end

p traverse($tree['shiny gold'])
p $count

#!/usr/bin/exec ruby


file  = File.open("input.txt")
blocks = file.read.split("\n\n").map { |monkey| monkey.split("\n").map(&:strip) }

class Monkey
  attr_accessor :name, :items, :op, :divider, :next_moneky
  attr_reader :count_inspects

  def initialize(name, items, op, divider, next_monkey)
    @name = name
    @items = items
    @op = op
    @divider = divider
    @next_monkey = next_monkey
    @count_inspects = 0
  end

  def do_action
    next_monkeys = Hash.new { |h, k| h[k] = [] }
    while @items.size > 0 do 
      @count_inspects += 1
      item = @items.shift
      oval = (@op[:op2] == "old" ? item : @op[:op2].to_i)
      nval = item.public_send(@op[:operator], oval)
      nval = nval / 3
      k = (nval % divider == 0).to_s.to_sym
      next_monkeys[@next_monkey[k]] << nval
    end
    next_monkeys
  end
end

monkeys = blocks.map { |line| 
  items = line[1].sub("Starting items: ", "")
    .split(",")
    .map(&:strip)
    .map(&:to_i)
  operation = line[2].sub("Operation: new = old", "")
  op = {
    operator: operation.split[0].to_sym,
    op2: operation.split[1]
  }
  divider = line[3].sub("Test: divisible by ", "").to_i
  next_monkey = {
    true: line[4].sub("If true: throw to monkey", "").to_i,
    false: line[5].sub("If false: throw to monkey", "").to_i,
  }

  name = line[0].match(/[a-zA-Z]+ (\d+):/)[1]
  Monkey.new(
    name,
    items,
    op,
    divider,
    next_monkey
  )
}

1.upto 20 do |i|
  mh = {}
  monkeys.each do |monkey|
    monkey.do_action.each do |to|
      monkeys
        .select { |m| m.name == to.first.to_s }
        .first
        .items
        .push(*to.last)
    end
  end
end

p monkeys
  .max(2) { |monkey1, monkey2| monkey1.count_inspects <=> monkey2.count_inspects }
  .map(&:count_inspects)
  .inject(&:*)

$commands = File.read('input').split("\n").map { |e| e.split }


def infinite?(commands)
  sum = 0
  already = []
  idx = 0

  loop do 
    cmd = commands[idx]
    case cmd.first
    when "acc"
      sum += cmd.last.to_i
      idx += 1
    when "jmp"
      idx += cmd.last.to_i
    when "nop"
      idx += 1
    else
      raise "No command: #{cmd}"
    end
    return 0 if already.include?(idx)
    return sum if idx == commands.size
    already << idx
  end
end

def indexes(val)
  $commands.each_with_index.find_all { |e, idx| e.first == val }.map { |e| e.last }
end

def switch(commands, idx)
  cmd = commands[idx]
  commands[idx] = cmd.first == 'nop' ? ['jmp', cmd.last] : ['nop', cmd.last]
  
  commands
end

$sum
indexes('nop').each do |idx|
  commands = switch($commands.dup, idx)
  $sum = infinite?(commands)
  p "nop:: #{$sum} #{idx}" if $sum != 0
end

indexes('jmp').each do |idx|
  commands = switch($commands.dup, idx)
  $sum = infinite?(commands)
  p "jmp:: #{$sum} #{idx}" if $sum != 0
end







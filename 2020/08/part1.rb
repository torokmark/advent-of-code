
commands = File.read('input').split("\n").map { |e| e.split }

# p commands

sum = 0
already = []
idx = 0

loop do 
  cmd = commands[idx]
  # p "#{cmd} #{idx}"
  
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

  #p "==> #{idx} #{already}"
  break if already.include?(idx)
  already << idx
end

p sum











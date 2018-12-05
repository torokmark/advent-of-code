RECORDS = File.readlines('inp').sort

hsh = Hash.new([])
id, start_sleep, end_sleep = nil

RECORDS.each do |line|
  tokens = line.scan(/(\[[0-9\- :]*\]) ([a-zA-Z0-9# ]+)/)
  time = tokens[0].first.scan(/([0-9]{2}):([0-9]{2})/) #.first[0]
  h = time.first[0].to_i
  m = time.first[1].to_i
  msg = tokens[0].last  # take the msg
  if msg.include?('#')  # if guard starts shift
    id = msg.split(' ')[1][1..-1] # get the id
    if not hsh.has_key?(id) # if not in hash, put it
      hsh[id] = []
    end
    start_sleep = 0
  elsif msg.eql?('wakes up')
    end_sleep = h * 60 + m  # wake up always the end of sleep
    hsh[id] << (start_sleep..end_sleep)
  elsif msg.eql?('falls asleep')
    start_sleep = h * 60 + m
  end
end

h = Hash.new
hsh.each { |key, value| 
  h[key] = value.map(&:size).inject(0, :+) 
}

id_with_most_minutes = h.max_by { |k, v| v }.first
minutes = Hash.new(0)
hsh[id_with_most_minutes.to_s].each do |sleep_period|
  sleep_period.each do |min|
    minutes[min] += 1
  end
end
minute_spend_asleep_most = minutes.max_by { |k, v| v }.first
p minute_spend_asleep_most * id_with_most_minutes.to_i


=begin
hsh.each { |x| p "#{ x[0] }, #{ x[1].inject(0, :+) } #{ x[1].max}" }
=end

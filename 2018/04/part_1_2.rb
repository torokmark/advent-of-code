RECORDS = File.readlines('input').sort

$guards = Hash.new([])
id, start_sleep, end_sleep = nil

RECORDS.each do |line|
  tokens = line.scan(/(\[[0-9\- :]*\]) ([a-zA-Z0-9# ]+)/)
  time = tokens[0].first.scan(/([0-9]{2}):([0-9]{2})/) #.first[0]
  h = time.first[0].to_i
  m = time.first[1].to_i
  msg = tokens[0].last  # take the msg
  if msg.include?('#')  # if guard starts shift
    id = msg.split(' ')[1][1..-1].to_i  # get the id
    if not $guards.has_key?(id) # if not in hash, put it
      $guards[id] = []
    end
    start_sleep = 0
  elsif msg.eql?('wakes up')
    end_sleep = h * 60 + m  # wake up always the end of sleep
    $guards[id] << (start_sleep..end_sleep) # save the range of sleeping
  elsif msg.eql?('falls asleep')
    start_sleep = h * 60 + m
  end
end

# PART 1

h = Hash.new
$guards.each { |key, value| 
  h[key] = value.map(&:size).inject(0, :+) # sum up the ranges by guard ids 
}

id_with_most_minutes = h.max_by { |k, v| v }.first # find the most sleepy guards.


def minutes_frequencies(id)
  minutes = Hash.new(0)
  $guards[id].each do |sleep_period| # figure out which minute is the most used
    sleep_period.each do |min|
      minutes[min] += 1
    end
  end
  minutes
end

minutes = minutes_frequencies(id_with_most_minutes)

minute_spend_asleep_most = minutes.max_by { |k, v| v }.first

p minute_spend_asleep_most
p minute_spend_asleep_most * id_with_most_minutes

p "guard id: #{ id_with_most_minutes } minute: #{ minute_spend_asleep_most }"

=begin
# Part 2
guards_minutes_frequency = Hash.new
$guards.each do |id, ranges|
  guards_minutes_frequency[id] = minutes_frequencies(id)
end

guards_minutes_frequency.each { |x| p x }
h = guards_minutes_frequency.select { |k, v| 
  v.has_key?(minute_spend_asleep_most) 
}

h.each do |id, minutes|
  h[id] = minutes[minute_spend_asleep_most]
end

p minute_spend_asleep_most
h.each { |x| p x }
=end


#!/usr/bin/exec ruby

file   = File.open("input.txt")
signal = file.read

def solve(signal)
  for i in 0..signal.size - 4
    marker = signal[i .. i + 3].chars.to_a
    #p marker
    return i + 4 if marker.uniq.size == marker.size
  end


end

=begin
signal = "mjqjpqmgbljsphdztnvjfqwrcgsmlb"    # 7
signal = "bvwbjplbgvbhsrlpgdmjqwftvncz"      # 5
signal = "nppdvjthqldpwncqszvftbrmjlhg"      # 6
signal = "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"  # 11
signal = "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"  # 10
=end

p solve(signal)
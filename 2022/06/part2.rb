#!/usr/bin/exec ruby

file   = File.open("input.txt")
signal = file.read

def solve(signal, length)
  for i in 0..signal.size - length
    marker = signal[i .. i + length - 1].chars.to_a
    #p marker
    return i + length if marker.uniq.size == marker.size
  end


end

=begin
signal = "mjqjpqmgbljsphdztnvjfqwrcgsmlb"    # 7
signal = "bvwbjplbgvbhsrlpgdmjqwftvncz"      # 5
signal = "nppdvjthqldpwncqszvftbrmjlhg"      # 6
signal = "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw"  # 11
signal = "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"  # 10
=end

p solve(signal, 14)
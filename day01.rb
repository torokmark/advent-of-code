#!/usr/bin/env ruby

def base
  current = 0

  File.readlines('day01.input').each do |frequency|
    current += frequency.to_i
  end

  current
end

def extended
  current = 0
  frequencies = [] << current

  curr_freqs = File.readlines('day01.input').map { |x| x.to_i }

  while true
    curr_freqs.each do |freq|
      current += freq
      frequencies << current
      return current if frequencies.uniq.length != frequencies.length
      p frequencies.size
    end
  end

end

p "==>> #{ extended }"



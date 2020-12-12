
numbers = File.readlines('input').map { |e| e.strip.to_i }

MY_NUMBER = 552655238

index = numbers.find_index(MY_NUMBER)

(0..index).each do |st|
  sum = 0
  en = 0
  while sum < MY_NUMBER
    sum = numbers[st..en].sum
    p numbers[st..en].minmax.sum if sum == MY_NUMBER
    en += 1
  end
end

CLAIMS = File.readlines('input')
  .map { |claim| 
    arr = claim.strip.split(' ')
    {
      id: Integer(arr[0][1..-1]),
      left: Integer(arr[2].split(',')[0]),
      top: Integer(arr[2].split(',')[1].chomp(':')),
      wide: Integer(arr[3].split('x')[0]),
      tall: Integer(arr[3].split('x')[1])
    }
  }


SIZE=1000
FABRIC = Array.new(SIZE) { Array.new(SIZE, 0) }
CLAIMS.each do |claim|
  wide_range = claim[:left]..claim[:left] + claim[:wide] - 1
  top_range = claim[:top]..claim[:top] + claim[:tall] - 1
  for i in wide_range
    for j in top_range
      FABRIC[i][j] += 1
    end
  end
end

### Part 1
#row = 0
#FABRIC.each { |f| p "#{ row += 1 } #{ f }" }
p FABRIC.flatten.select { |x| x > 1 }.size

### Part 2

def overlap?(claim)
  wide_range = claim[:left]..claim[:left] + claim[:wide] - 1
  top_range = claim[:top]..claim[:top] + claim[:tall] - 1
  for i in wide_range
    for j in top_range
      if FABRIC[i][j] > 1
        return true
      end
    end
  end
  return false
end


CLAIMS.each do |claim|
  if not overlap?(claim)
    p claim[:id]
    break
  end
end



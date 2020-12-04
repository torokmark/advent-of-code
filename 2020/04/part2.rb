
data = File.read('input').split("\n\n")

def valid?(pass)
  [
    {byr: /^(19[2-9][0-9]|200[0-2])$/},
    {iyr: /^(201[0-9]|2020)$/}, 
    {eyr: /^(202[0-9]|2030)$/}, 
    {hgt: /^((1[5-8][0-9]|19[0-3])cm|(59|6[0-9]|7[0-6])in)$/},
    {hcl: /^(#[0-9a-f]{6})$/}, 
    {ecl: /^(amb|blu|brn|gry|grn|hzl|oth)$/}, 
    {pid: /^[0-9]{9}$/}
  ].all? do |attr|
    #p pass[attr.keys.first.to_s].match(attr.values.first)
    pass.has_key?(attr.keys.first.to_s) && pass[attr.keys.first.to_s].match(attr.values.first)
  end
end

passes = data.map { |pass| pass.split }
             .map { |pass| pass.map{ |item| Hash[*item.split(":")] } }

passes.map! { |pass| pass.inject(&:merge) }

#passes.each do |pass|
#  p pass if not valid?(pass)
#end

p passes.count { |pass| valid?(pass) }

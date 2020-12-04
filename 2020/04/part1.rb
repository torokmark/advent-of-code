
data = File.read('input').split("\n\n")

def valid?(pass)
  [:ecl, :pid, :eyr, :hcl, :byr, :iyr, :hgt].all? { |attr| pass.has_key?(attr.to_s) }
end

passes = data.map { |pass| pass.split }
             .map { |pass| pass.map{ |item| Hash[*item.split(":")] } }

passes.map! { |pass| pass.inject(&:merge) }

p passes.count { |pass| valid?(pass) }

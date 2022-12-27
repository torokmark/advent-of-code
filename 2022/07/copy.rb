file_path = File.expand_path("../sample02.txt", __FILE__)
input     = File.read(file_path)

directories = Hash.new { |h, k| h[k] = [] }

current_dir = []

input.each_line do |line|
  case line.split
  in [/\d+/ => size, _file]
    directories[current_dir.clone] << size.to_i
    #p "1. #{directories}"
  in ["dir", /\w+/ => dir]
    new_dir = current_dir.clone.append(dir)
    directories[current_dir.clone] << directories[new_dir]
    #p "2. #{directories}"
  in ["$", "cd", ".."]
    current_dir.pop
    #p "3. #{directories}"
  in ["$", "cd", /.+/ => dir]
    current_dir << dir
    #p "4. #{directories}"
  else # ls
    #p "5. #{directories}"
  end
end

p directories

puts directories.map { |_k, v| v.flatten.sum }
  .select { |size| size <= 100_000 }
  .sum
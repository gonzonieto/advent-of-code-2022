input = IO.readlines("input.txt", chomp: true)

counter = 0
elves = []

input.each do |entry|
  counter += 1 if entry == ""
  elves[counter] ? elves[counter] += entry.to_i : elves[counter] = entry.to_i
end

max_indices = elves.each_index.max_by(3) { |i| elves[i] }

top_three_calorie_counter = 0

max_indices.each { |i| top_three_calorie_counter += elves[i] }

puts top_three_calorie_counter

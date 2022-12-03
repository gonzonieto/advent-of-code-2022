require "awesome_print"

def score_round(round)
  score = 0
  opponent, you = round

  case you
  when "Rock"
    score += 1
  when "Paper"
    score += 2
  when "Scissors"
    score += 3
  end

  score += 3 if you == opponent

  if opponent == "Rock"
    score += 6 if you == "Paper"
  elsif opponent == "Paper"
    score += 6 if you == "Scissors"
  elsif opponent == "Scissors"
    score += 6 if you == "Rock"
  end

  score
end

input_key = {
  A: "Rock",
  B: "Paper",
  C: "Scissors",
  X: "Rock",
  Y: "Paper",
  Z: "Scissors"
}

rounds = IO.readlines("input.txt", chomp: true)
  .map! { |entry| entry.split(" ")}
  .each.map do |pair|
    [input_key[pair[0].to_sym], input_key[pair[1].to_sym]]
  end

score = 0

rounds.each do |round|
  score += score_round(round)
end

puts score

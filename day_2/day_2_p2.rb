game_key = {
  rock: { win: :paper, lose: :scissors, draw: :rock },
  paper: { win: :scissors, lose: :rock, draw: :paper },
  scissors: { win: :rock, lose: :paper, draw: :scissors }
}

input_key = {
  A: :rock,
  B: :paper,
  C: :scissors,
  X: :lose,
  Y: :draw,
  Z: :win
}

score_key = {
  rock: 1,
  paper: 2,
  scissors: 3,
  lose: 0,
  draw: 3,
  win: 6
}

rounds_input = IO.readlines("input.txt", chomp: true)
  .map! { |entry| entry.split(" ")}
  .each.map do |pair|
    [input_key[pair[0].to_sym], input_key[pair[1].to_sym]]
  end

rounds_result = rounds_input.map { |shape, outcome| [game_key[shape][outcome], outcome] }

puts score = rounds_result.flatten.map { |e| score_key[e] }.reduce(:+)

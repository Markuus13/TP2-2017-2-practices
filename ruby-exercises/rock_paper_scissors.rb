class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

PLAYS = { "R" => 1, "P" => 2, "S" => 3 }

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  game.each do |move|
    raise NoSuchStrategyError unless PLAYS.keys.include?(move.last)
  end
  first_move, second_move = game.map(&:last)
  first_player_wins = [-2,1]
  score = PLAYS[first_move] - PLAYS[second_move]
  return game.first if score == 0 || first_player_wins.include?(score)
  game.last
end

# First player wins #
# R - S = -2
# P - R = 1
# S - P = 1
# Second player wins #
# S - R = 2
# R - P = -1
# P - S = -1

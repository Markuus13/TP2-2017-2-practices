class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

MOVES = { "R" => 1, "P" => 2, "S" => 3 }
VALID_STRATEGIES = PLAYS.keys

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  raise NoSuchStrategyError unless valid_strategies?(game)

  first_move, second_move = game.map(&:last)
  first_player_wins = [-2,1]
  score = MOVES[first_move] - MOVES[second_move]
  
  return game.first if score == 0 || first_player_wins.include?(score)
  game.last
end

def valid_strategies?(game)
  game_strategies = game.map(&:last)
  (game_strategies - VALID_STRATEGIES).empty?
end

# First player wins #
# R - S = -2
# P - R = 1
# S - P = 1
# Second player wins #
# S - R = 2
# R - P = -1
# P - S = -1

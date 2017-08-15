class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

VALID_STRATEGIES = ["R", "P", "S"]

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  game.each do |move|
    raise NoSuchStrategyError unless VALID_STRATEGIES.include?(move.last)
  end
end

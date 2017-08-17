require_relative 'rock_paper_scissors'

RSpec.describe "Rock Paper Scissors" do
  describe "#rps_game_winner" do
    context "when number of players is different than 2" do
      it "raises WrongNumberOfPlayersError" do
        expect { rps_game_winner([[ "Kristen", "P"]]) }.
          to raise_error("WrongNumberOfPlayersError")
      end
    end

    context "when player's strategy is different than 'R', 'P' or 'S'" do
      it "raises NoSuchStrategyError" do
        expect { rps_game_winner([[ "Kristen", "T"], [ "Pam", "S" ]]) }.
          to raise_error("NoSuchStrategyError")
      end
    end

    context "when player's strategy are different from the other" do
      it "returns the name and strategy of the winning player" do
        expect(rps_game_winner([ [ "Kristen", "P" ], [ "Pam", "S" ] ])).
          to match_array([ "Pam", "S" ])
      end
    end

    context "when both players use the same strategy" do
      it "return the name and strategy of first player" do
        expect(rps_game_winner([ [ "Kristen", "P" ], [ "Pam", "P" ] ])).
          to match_array(["Kristen", "P"])
      end
    end
  end
end

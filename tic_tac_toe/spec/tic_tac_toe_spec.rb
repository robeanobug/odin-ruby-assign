require_relative '../tic_tac_toe'
require 'stringio'

RSpec.describe Game do
  let(:game) { Game.allocate } # skips initialize
  before do
    game.instance_variable_set(:@player1, double("Player", marker: "X", name: "Player 1"))
    game.instance_variable_set(:@player2, double("Player", marker: "O", name: "Player 2"))
    game.instance_variable_set(:@current_player, game.instance_variable_get(:@player1))
    game.instance_variable_set(:@board, [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ])
  end

  describe "#winner?" do
    context "when a player has three in a row" do
      before do
        game.instance_variable_set(:@board, [
          ["X", "X", "X"],
          [4, 5, 6],
          [7, 8, 9]
        ])
      end

      it "returns true if a player has three in a row" do
        expect(game.winner?).to eq(true)
      end

      it "prints out the winner message" do
        output = StringIO.new
        $stdout = output

        game.winner?

        $stdout = STDOUT

        expected_output = "Congratulations! Player 1 is the winner!\n"
        expect(output.string).to eq(expected_output)
      end
    end

    context "when a player does not have three in a row" do
      before do
        game.instance_variable_set(:@board, [
          ["X", "O", "X"],
          ["O", "O", "X"],
          ["X", "X", "O"]
        ])
      end

      it "returns false if all players do not have three in a row" do
        expect(game.winner?).to be_falsey
      end
    end
  end

  describe "#print_board" do
    it "prints the board out correctly" do
      output = StringIO.new
      $stdout = output

      game.print_board

      $stdout = STDOUT

      expected_output = <<~BOARD
      1 | 2 | 3
      --+---+--
      4 | 5 | 6
      --+---+--
      7 | 8 | 9
      BOARD
            
      expect(output.string).to eq(expected_output)
    end
  end

  describe "#place_marker" do
    before do
      game.instance_variable_set(:@free_positions, (1..9).to_a)
    end
    it "places the current player's marker on the board" do
      input = StringIO.new("5\n")
      $stdin = input

      game.place_marker

      $stdin = STDIN

      expected_board = [
        [1, 2, 3],
        [4, "X", 6],
        [7, 8, 9]
      ]
            
      expect(game.instance_variable_get(:@board)).to eq(expected_board)
    end
  end
end
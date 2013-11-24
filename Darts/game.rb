require "./dart_board.rb"
require "./player.rb"

class Game
  def initialize
    @board = DartBoard.new()
    @player_a = Player.new(@board, "a")
    @player_b = Player_B.new(@board, "b")
  end

  def start_with(choice)
    while @player_a.get_score != 0 && @player_b.get_score != 0
      if choice.eql? "a"
        @player_a.take_turn
        @player_b.take_turn
      elsif choice.eql? "b"
        @player_b.take_turn
        @player_a.take_turn
      end
    end
    @player_a.get_score == 0 ? @player_a.name : @player_b.name
  end
end
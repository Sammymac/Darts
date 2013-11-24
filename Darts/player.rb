require "./dart_board.rb"

class Player
  def initialize(board, name)
    @board = board.get_dartboard
    @name = name
    @score = 501
  end

  def name
    @name
  end

  def get_board
    @board
  end

  def take_turn
    new_score = @score - play
    @score = new_score if new_score >= 0
  end

  def get_score
    @score
  end

  def play
    @board.sample
  end

end

class Player_B < Player
  def play
    section = 0
    if @score <= 20 && @score > 0
      section = get_neighbours(@score).sample
    else
      highest_num = 0
      @board.each do |x|
        sum = 0
        get_neighbours(x).each{|a| sum+=a }
        if sum > highest_num
          highest_num = sum
          section = x
        end
      end
    end
    get_neighbours(section).sample
  end

  def get_neighbours(num)
    num_i = get_board.index(num)
    [(get_board[(num_i-1)%20]), (get_board[num_i]), (get_board[(num_i + 1)%20])]
  end
end
require "./game.rb"

class Simulation
  def initialize
    @file = File.new("darts.log", "w")
  end

  def to_s(string)
    puts string
  end

  def to_s_to_file(string)
    to_s(string)
    @file.write(string + "\n")
  end

  def run_test
    a = 0.000
    b = 0.000
    counter = 0
    start = "b"
    10000.times do
      game = Game.new
      counter+=1
      start.eql? "a" ? start = "b" : start = "a"
      to_s_to_file "Game #{counter} is about to start..."
      starter_wins = (game.start_with(start)).eql? start
      if starter_wins && start == "a"
        to_s_to_file "The winner is player A"
        a+=1
      elsif starter_wins && start == "b"
        to_s_to_file "The winner is player B"
        b+=1
      elsif !starter_wins && start == "a"
        to_s_to_file "The winner is player A-"
      elsif !starter_wins && start == "b"
        to_s_to_file "The winner is player B"
      end



    end
    to_s "Probability of A winning when A goes first: #{(a/10000).round(3)}%"
    to_s "Probability of B winning when B goes first: #{(b/10000).round(3)}%"
  end
end
require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play(rounds)
    puts "There are #{@players.size} players in #{@title}:"

    puts @players

    treasures = TreasureTrove::TREASURES

    puts "\nThere are #{treasures.length} treasures to be found: "

    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points"
    end

    1.upto(rounds) do |round|
      puts "\nRound #{round}:"

      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
      end
    end
  end

  def print_stats
    puts "\n#{@title}'s Stats:"

    strong, wimpy = @players.partition(&:strong?)

    puts "\n#{strong.length} strong players:"
    puts strong

    puts "\n#{wimpy.length} wimpy players:"
    puts wimpy

    puts "\n#{@title}'s High Scores"

    @players.sort_by { |p| -p.score }.each do |sp|
      puts "#{sp.name.ljust(20, '.')} #{sp.score}"
    end
  end
end

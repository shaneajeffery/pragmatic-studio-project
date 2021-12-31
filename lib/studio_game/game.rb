require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

module StudioGame
  class Game
    def initialize(title)
      @title = title
      @players = []
    end

    def load(from_file)
      File.readlines(from_file).each do |line|
        add_player(Player.from_csv(line))
      end
    end

    def save(to_file = 'player_high_scores.csv')
      File.open(to_file, 'w') do |file|
        @players.sort_by { |p| -p.score }.each do |player|
          file.puts player.to_csv
        end
      end
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

      puts "\nPoint totals:"

      @players.each do |player|
        puts "\n#{player.name}'s point totals:"
        player.each_found_treasure do |treasure|
          puts "#{treasure.points} total #{treasure.name} points"
        end
        puts "#{player.points} grand total points"
      end

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
end

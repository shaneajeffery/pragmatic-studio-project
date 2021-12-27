require_relative 'player'

class Game
  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def play
    puts "There are #{@players.size} players in #{@title}:"

    @players.each do |player|
      3.times { player.w00t }
      2.times { player.blam }
      puts player
    end
  end
end
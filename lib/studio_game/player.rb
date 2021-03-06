require_relative 'playable'

module StudioGame
  class Player
    include Playable

    attr_accessor :name, :health

    def initialize(name, health = 100)
      @name = name.capitalize
      @health = health
      @found_treasures = Hash.new(0)
    end

    def each_found_treasure
      @found_treasures.each do |name, points|
        treasure = Treasure.new(name, points)
        yield treasure
      end
    end

    def found_treasure(treasure)
      @found_treasures[treasure.name] += treasure.points
      puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
      puts "#{@name}'s treasures: #{@found_treasures}"
    end

    def points
      @found_treasures.values.reduce(0, :+)
    end

    def score
      @health + points
    end

    def to_s
      "#{@name} | Health: #{@health} | Points: #{points} | Score: #{score}"
    end

    def self.from_csv(line)
      name, health = line.split(',')
      Player.new(name, Integer(health))
    end

    def to_csv
      "#{@name},#{score}"
    end
  end
end

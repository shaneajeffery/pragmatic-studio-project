require_relative 'player'
require_relative 'treasure_trove'

class ClumsyPlayer < Player
  def found_treasure(treasure)
    points = treasure.points / 2.0 # Need a float here because we don't want the integer class rounding for us.
    super(Treasure.new(treasure.name, points))
  end
end
require_relative 'player'

class BerserkPlayer < Player
  def initialize(name, health = 100)
    @w00t_count = 0
    super(name, health)
  end

  def berserk?
    @w00t_count > 5
  end

  def w00t
    super
    @w00t_count += 1
    puts 'Berserker is berserk!' if berserk?
  end

  def blam
    if berserk?
      w00t
    else
      super
    end
  end
end

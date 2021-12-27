class Player
  def initialize(name, health = 100)
    @name = name.capitalize
    @health = health
  end

  attr_accessor :name, :health

  def score
    @health + @name.length
  end

  def to_s
    "#{@name} | Health: #{@health} | Score: #{score}"
  end

  def strong?
    @health > 100
  end

  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end

  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end
end
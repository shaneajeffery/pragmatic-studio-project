# frozen_string_literal: true

class Player
  def initialize(name, health = 100)
    @name = name.capitalize
    @health = health
  end

  def to_s
    "I'm #{@name} with a health of #{@health}."
  end

  # def time
  #   current_time = Time.new
  #   current_time.strftime('%I:%M:%S')
  # end

  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end

  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end
end

player1 = Player.new('moe')
puts player1

player2 = Player.new('larry', 60)
puts player2

player3 = Player.new('curly', 125)
puts player3
player3.blam
puts player3
player3.w00t
puts player3




#
# def say_hello(player_name, player_health = 100)
#   "I'm #{player_name.capitalize} with a health of #{player_health} as of #{time}."
# end
#
# puts say_hello('larry', 60)
# puts say_hello('curly', 125)
# puts say_hello('moe')
# puts say_hello('shemp', 90)

# name1 = 'larry'
# health1 = 60
#
# puts "#{name1.capitalize} has a health of #{health1}"
#
# name2 = 'curly'
# health2 = 125
#
# puts "#{name2.upcase} has a health of #{health2}"
#
# name3 = 'moe'
# health3 = 100
#
# puts "#{name3.capitalize} has a health of #{health3}.".center(50, '*')
#
# name4 = 'shemp'
# health4 = 90
#
# puts format_output(name4, health4)


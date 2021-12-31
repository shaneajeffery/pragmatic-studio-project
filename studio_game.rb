# frozen_string_literal: true

require_relative 'player'
require_relative 'game'

knuckleheads = Game.new('Knuckleheads')
knuckleheads.load(ARGV.shift || 'players.csv')

loop do
  puts "\nHow many rounds for the game? ('quit' to exist)"
  answer = gets.chomp.downcase

  case answer
  when /^\d+$/
    knuckleheads.play(answer.to_i)
  when 'quit', 'exit'
    knuckleheads.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

knuckleheads.save






# knuckleheads.play(3)
# knuckleheads.print_stats

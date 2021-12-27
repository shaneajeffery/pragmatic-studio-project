require_relative 'game'
require_relative 'player'
require_relative 'die'

describe Game do

  before do
    @initial_health = 150
    @game = Game.new('Knuckleheads')
  end

  context 'being played with one player' do
    before do
      @player = Player.new('Shane', @initial_health)
      @game.add_player(@player)
    end

    it 'w00ts the player if a high number is rolled' do
      # Newer rspec syntax for stubbing.
      Die.any_instance.stub(:roll).and_return(5)
      @game.play(2)

      expect(@player.health).to eq(@initial_health + 15)
    end

    it 'skips the player if a medium number is rolled' do
      # Newer rspec syntax for stubbing.
      Die.any_instance.stub(:roll).and_return(3)
      @game.play(2)

      expect(@player.health).to eq(@initial_health)
    end

    it 'blams the player if a low number is rolled' do
      # Newer rspec syntax for stubbing.
      Die.any_instance.stub(:roll).and_return(1)
      @game.play(2)

      expect(@player.health).to eq(@initial_health - 10)
    end
  end

end
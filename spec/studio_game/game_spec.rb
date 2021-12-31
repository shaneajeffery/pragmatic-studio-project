require 'studio_game/game'
require 'studio_game/player'
require 'studio_game/die'

module StudioGame
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
        @game.play(1)

        expect(@player.health).to eq(@initial_health + 15)
      end

      it 'skips the player if a medium number is rolled' do
        # Newer rspec syntax for stubbing.
        Die.any_instance.stub(:roll).and_return(3)
        @game.play(1)

        expect(@player.health).to eq(@initial_health)
      end

      it 'blams the player if a low number is rolled' do
        # Newer rspec syntax for stubbing.
        Die.any_instance.stub(:roll).and_return(1)
        @game.play(1)

        expect(@player.health).to eq(@initial_health - 10)
      end
    end

    it "assigns a treasure for points during a player's turn" do
      game = Game.new('Knuckleheads')
      player = Player.new('moe')

      game.add_player(player)

      game.play(1)

      player.points.should_not be_zero

      # or use alternate expectation syntax:
      # expect(player.points).not_to be_zero
    end
  end
end
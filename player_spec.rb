# frozen_string_literal: true

require_relative 'player'

describe Player do
  before do
    @player = Player.new('larry', 150)
  end

  it 'has a capitalized title' do
    expect(@player.name).to eq('Larry')
  end

  it 'has an initial health' do
    expect(@player.health).to eq(150)
  end

  it 'has a string representation' do
    expect(@player.to_s).to eq('Larry | Health: 150 | Score: 155')
  end

  it 'increases health by 15 when w00ted' do
    @player.w00t

    expect(@player.health).to eq(165)
  end

  it 'decreases health by 10 when blammed' do
    @player.blam

    expect(@player.health).to eq(140)
  end

  it 'is strong' do
    expect(@player).to be_strong
  end

  context 'created with a default health' do
    before do
      @player = Player.new('larry')
    end

    it 'has health of 100' do
      expect(@player.health).to eq(100)
    end
  end

  context 'in a collection of players' do
    before do
      @player1 = Player.new('moe', 100)
      @player2 = Player.new('larry', 200)
      @player3 = Player.new('curly', 300)

      @players = [@player1, @player2, @player3]
    end

    it 'is sorted by decreasing score' do
      expect(@players.sort_by { |p| -p.score }).to eq([@player3, @player2, @player1])
    end
  end
end

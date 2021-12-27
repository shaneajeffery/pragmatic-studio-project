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
    expect(@player.to_s).to eq("I'm Larry with a health of 150 and a score of 155.")
  end

  it 'increases health by 15 when w00ted' do
    @player.w00t

    expect(@player.health).to eq(165)
  end

  it 'decreases health by 10 when blammed' do
    @player.blam

    expect(@player.health).to eq(140)
  end

  context 'created with a default health' do
    before do
      @player = Player.new('larry')
    end

    it 'has health of 100' do
      expect(@player.health).to eq(100)
    end
  end
end

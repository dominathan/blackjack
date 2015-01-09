require 'spec_helper'
require_relative '../lib/deck.rb'
require_relative '../lib/player.rb'
require_relative '../lib/black_jack.rb'

describe 'the player' do
  player = Player.new

  it 'should exist' do
    expect(player).to_not be_nil
  end

  it 'should have an empty hand of cards' do
    expect(player.hand).to eq([])
  end

  it 'should have a initial bank value of $100' do
    expect(player.bank).to eq(100)
  end

end

require 'spec_helper'
require_relative '../lib/deck.rb'
require_relative '../lib/player.rb'
require_relative '../lib/black_jack.rb'

describe 'black_jack' do
  bj = BlackJack.new

  context 'the player' do

    it 'should exist' do
      expect(bj.player).to_not be_nil
    end

    it 'should have an empty hand of cards' do
      expect(bj.player.hand).to eq([])
    end

    it 'should have a initial bank value of $100' do
      expect(bj.player.bank).to eq(100)
    end

    it 'should have a full deck in hand' do
      expect(bj.player.cards.count).to eq(52)
    end
  end



  it 'should have a dealer' do
    expect(bj.dealer).to_not be_nil
  end
end

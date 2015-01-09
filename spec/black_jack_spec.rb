require 'spec_helper'
require_relative '../lib/deck.rb'
require_relative '../lib/player.rb'
require_relative '../lib/dealer.rb'
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
  end

  context 'should have a dealer' do
    it 'that exists' do
      expect(bj.dealer).to_not be_nil
    end

    it 'should have an empty hand of cards' do
      expect(bj.player.hand).to eq([])
    end
  end

  describe 'when the game begins' do
    let(:player) { bj.player }
    context 'the player' do
      it 'should lose $10' do
        expect(player.bank).to eq(90)
      end

      it 'should have two cards' do
        expect(player.hand.count).to eq(2)
      end

    end
  end

end

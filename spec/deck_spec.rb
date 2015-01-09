require 'spec_helper'
require_relative '../lib/deck.rb'
require_relative '../lib/player.rb'
require_relative '../lib/black_jack.rb'

describe 'blackjack ...' do
  deck = Deck.new

  context 'the deck of cards...' do
    it 'should have 52 cards in it' do
      expect(deck.cards.count).to eq(52)
    end
    it 'should have 16 cards with a value of 10 (e.g. 10\'s,Jacks, Queens, Kings)' do
      expect(deck.cards.count(10)).to eq(16)
    end
    it 'should have 32 cards with a value of 2..9'  do
      expect(deck.cards.count(2)).to eq(4)
      expect(deck.cards.count(3)).to eq(4)
      expect(deck.cards.count(4)).to eq(4)
      expect(deck.cards.count(5)).to eq(4)
      expect(deck.cards.count(6)).to eq(4)
      expect(deck.cards.count(7)).to eq(4)
      expect(deck.cards.count(8)).to eq(4)
      expect(deck.cards.count(9)).to eq(4)
    end
    it 'should have 4 ace cards' do
      expect(deck.cards.count(11) || deck.cards.count(1)).to eq(4)
    end
  end

  context 'you should be able' do
    it 'to shuffle the cards' do
      deck1 = Deck.new
      expect(deck1).to eq(deck1)
      deck2 = deck1.shuffle
      expect(deck1).to_not eq(deck2)
    end

    it 'to draw/deal two cards' do
      deck1 = Deck.new
      two_cards = deck1.deal
      expect(deck1.cards.count).to eq(50)
      expect(two_cards.count).to eq(2)
      expect(deck1.cards.include?(two_cards)).to eq(false)
    end

    it 'to draw/hit one card' do
      deck1 = Deck.new
      one_card = deck1.hit
      expect(deck1.cards.count).to eq(51)
      expect(one_card).to_not be_nil
    end
  end

end

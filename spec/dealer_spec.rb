require 'spec_helper'
require_relative '../lib/deck.rb'
require_relative '../lib/player.rb'
require_relative '../lib/dealer.rb'
require_relative '../lib/black_jack.rb'

describe 'the dealer' do
  dealer = Dealer.new
  it 'should exist' do
    expect(dealer).to_not be_nil
  end

  it 'should have an empty hand of cards' do
    expect(dealer.hand).to eq([])
  end

end

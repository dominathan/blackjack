class Player
  attr_accessor :score, :bank, :hand, :cards

  def initialize
    @score = 0
    @bank = 100
    @cards = Deck.new
    @hand = []
  end

end

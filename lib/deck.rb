class Deck
  attr_accessor :cards

  def initialize
    ace_cards = [11]*4
    ten_cards = [10]*16
    @cards = ((2..9).to_a * 4).concat(ace_cards).concat(ten_cards).shuffle
  end

  def shuffle
    @cards = @cards.shuffle
  end

  def count
    @cards.count
  end

  def deal
    @cards.shift(2)
  end

  def hit
    @cards.shift
  end


end

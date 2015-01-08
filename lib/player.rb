class Player
  attr_accessor :score, :bank, :hand

  def initialize
    @score = 0
    @bank = 100
    @hand = []
  end

end

class BlackJack
  attr_accessor :player, :dealer, :cards

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @cards = Deck.new
  end

  def play
    @player.bank -= 10
    puts "-"*30
    puts 'Let\'s Play BlackJack'
    puts "You have $#{@player.bank}"
    answer = 'h'
    while @player.bank > 0
      draw(@player,'deal')
      draw(@dealer, 'deal')
      while answer.downcase == "h" || answer.downcase == "hit" && @player.bank > 0
        puts "Would you like to stay or to hit?"
        answer = gets.chomp
        if answer == 'h' || answer == 'hit'
          draw(@player, 'hit')
          if BlackJack.is_hand_bust?(@player)
            puts "You Lose. Your hand is BUST!!!! #{@player.hand.flatten(@player.hand.length)} : Value = #{BlackJack.sum_hand(@player.hand)}"
            @player.hand = []
            @dealer.hand = []
            play
          else
            puts "Your value is #{BlackJack.sum_hand(@player.hand)}"
          end
        else
          value = BlackJack.sum_hand(@player.hand)
          puts "You are staying with #{value}"
          dealer_value = BlackJack.sum_hand(@dealer.hand)
          while dealer_value.first < 17
            draw(@dealer,'hit')
            dealer_value = BlackJack.sum_hand(@dealer.hand)
            hand_value_calculator('dealer', dealer_value)
          end
          if dealer_value.first < 21 && dealer_value.first > value.first
            puts "Dealer won with #{dealer_value} compare to your #{value}"
          elsif dealer_value.first > 21
            puts "YOU WIN!!! with #{value} vs DEALER #{dealer_value}"
          elsif dealer_value.first < 21 && dealer_value.first < value.first
            puts "YOU WINN!!!! with #{value} vs Dealer #{dealer_value}"
          end
        end
      end
      @player.hand = []
      @dealer.hand = []
      play
    end
  end

  def draw(player,draw)
    if draw == "hit"
      player.hand << @cards.hit
    else
      player.hand << @cards.deal
    end
    puts "Your hand is #{player.hand.flatten(player.hand.length)}."
    hand_value_calculator(player,BlackJack.sum_hand(player.hand))
  end

  def hand_value_calculator(name,value)
    if value.length > 1
      puts "#{name} has either #{value.first} or #{value.last}"
    else
      puts "#{name} has #{value.first}"
    end
  end

  def self.is_hand_bust?(player)
    value = BlackJack.sum_hand(player.hand)
    value.first > 21 ? true : false
  end

  def self.sum_hand(hand)
    flathand = hand.flatten(hand.length)
    if !flathand.include?(11)
      [flathand.reduce(:+)]
    else
      aces_eleven = flathand.reduce(:+)
      aces_one = flathand.map { |number| number == 11 ? number = 1 : number }.reduce(:+)
      [aces_one, aces_eleven]
    end
  end

end

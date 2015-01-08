require 'pry'

class BlackJack
  attr_accessor :player

  def initialize
    @player = Player.new
  end

  def play
    @player.bank -= 10
    puts "-"*30
    puts 'Let\'s Play BlackJack'
    puts "You have $#{@player.bank}"
    answer = 'h'
    while @player.bank > 0
      BlackJack.draw(@player,'deal')
      while answer.downcase == "h" || answer.downcase == "hit" && @player.bank > 0
        puts "Would you like to stay or to hit?"
        answer = gets.chomp
        if answer == 'h' || answer == 'hit'
          BlackJack.draw(@player, 'hit')
          if BlackJack.is_hand_bust?(@player)
            puts "You Lose. Your hand is BUST!!!! #{@player.hand.flatten(@player.hand.length)} : Value = #{BlackJack.sum_hand(@player.hand)}"
            @player.hand = []
            play
          else
            puts "Your value is #{BlackJack.sum_hand(@player.hand)}"
          end
        else
          puts "You may stay with #{BlackJack.sum_hand(@player.hand)}"
        end
      end
      @player.hand = []
      play
    end
  end

  def self.draw(player,draw)
    if draw == "hit"
      player.hand << player.cards.hit
    else
      player.hand << player.cards.deal
    end
    puts "Your hand is #{player.hand.flatten(player.hand.length)}."
    value = BlackJack.sum_hand(player.hand)
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

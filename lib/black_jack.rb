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
    while @player.bank > 0
      @player.hand << @player.cards.deal
      value = BlackJack.sum_hand(@player.hand)
      puts "Your current hand is #{@player.hand[0]} #{@player.hand[1]}"
      if value.length < 2
        puts "Your value is #{value.first}"
      else
        puts "You either have #{value.first.to_s} or #{value.last.to_s}"
      end
      puts "Would you like to stay or to hit?"
      answer = gets.chomp
      if answer.downcase == "h" || answer.downcase == "hit"
        @player.hand << @player.cards.hit
        puts "Your new hand is #{@player.hand.flatten(@player.hand.length)}."
        value = BlackJack.sum_hand(@player.hand)
        if value.first > 21
          puts "You Lose. You got #{value.first}!! \n You are BUST!!! (above 21)"
        else
          if value.length < 2
            puts "Your value is #{value.first}"
          else
            puts "You either have #{value.first} or #{value.last}"
          end
          puts "Would you like to stay or hit!?"
          answer = gets.chomp
          if answer.downcase == "h" || answer.downcase == "hit"
            @player.hand << @player.cards.hit
            puts "Your new hand is #{@player.hand.flatten(@player.hand.length)}."
            value = BlackJack.sum_hand(@player.hand)
            if value.first > 21
              puts "You Lose. You got #{value.first}!! \n You are BUST!!! (above 21)"
            else
              if value.length < 2
                puts "Your value is #{value.first}"
              else
                puts "You either have #{value.first} or #{value.last}"
              end
            end
          end
        end
      else
        puts "You chose to stay at #{BlackJack.sum_hand(@player.hand)}"
      end
      @player.hand = []
      play
    end
  end

  def self.sum_hand(hand)
    flathand = hand.flatten(hand.length)
    if !flathand.include?(11)
      [flathand.reduce(:+)]
    else
      aces_eleven = flathand.reduce(:+)
      aces_one = flathand.map { |number| number == 11 ? number = 1 : number }.reduce(:+)
      [aces_eleven, aces_one]
    end
  end

end

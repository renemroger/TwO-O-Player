module Pick
  def pick()
    return gets.chomp.to_i
  end
end

class Player
  attr_reader :life_points
  attr_reader :name
  include Pick

  def initialize(name, lf)
    @name = name
    @life_points = lf
  end

  def update_life(damage)
    @life_points += damage
  end
end


class Match
  attr_reader :answer
  attr_reader :number1
  attr_reader :number2  
  attr_reader :turn

  def initialize(n)
    @number1 = Random.rand(n)
    @number2 = Random.rand(n)
    @answer = @number1 + @number2
    @turn = 1
    @MAXN = n
  end
  def to_s
    "What does #{self.number1} plus #{self.number2} equal?"
  end

  def next_turn
    @turn =  (@turn % 2) + 1
  end


  def randomize
    @number1 = Random.rand(@MAXN)
    @number2 = Random.rand(@MAXN)
    @answer = self.number1 + self.number2
  end

  def check_answer(ans)
    if ans == @answer
      puts "YES! You are correct."
      return 0
    elsif ans != @answer
      puts "Seriously? No!"
      return -1
    end
  end
end

MAXLIFE = 3
MAXN = 20

p1 = Player.new("Player 1", MAXLIFE)
p2 = Player.new("Player 2", MAXLIFE)
game = Match.new(MAXN)


def play(player,game)
    puts "#{player.name}  #{game}"
    answer = game.check_answer(player.pick)
    player.update_life(answer)
    game.randomize
    game.next_turn
end


while(p1.life_points > 0 && p2.life_points > 0)
  puts "P1: #{p1.life_points}/#{MAXLIFE} vs P2: #{p2.life_points}/#{MAXLIFE}"
  if(game.turn == 1)
    play(p1,game)
  elsif (game.turn == 2)
    play(p2,game)
  end
  puts (p1.life_points > 0 && p2.life_points > 0) ? "---NEW TURN---" : ""  
end
 puts p1.life_points > 0 ? "#{p1.name} wins with a score of #{p1.life_points}/#{MAXLIFE}" : 
 "#{p2.name} wins with a score of #{p2.life_points}/MAXLIFE"
 puts "---GAME OVER---"
 puts "Good Bye!"



# answer = gets.chomp


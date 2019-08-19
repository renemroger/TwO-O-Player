require './modules'
require './player'
require './match'

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

  game.turn == 1 ? play(p1,game) :  play(p2,game)

  puts (p1.life_points > 0 && p2.life_points > 0) ? "---NEW TURN---" : ""  
end
 puts p1.life_points > 0 ? "#{p1.name} wins with a score of #{p1.life_points}/#{MAXLIFE}" : 
 "#{p2.name} wins with a score of #{p2.life_points}/#{MAXLIFE}"
 puts "---GAME OVER---"
 puts "Good Bye!"



# answer = gets.chomp


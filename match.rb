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
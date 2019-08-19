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

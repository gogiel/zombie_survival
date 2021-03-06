class Zombie
  include LivingObject

  def initialize(game)
    @hp = 1
    @game = game
    @x = 5
    @y = 5
    @last_tick_count = 0
    @ticks_needed = 25
    @last_move_x = true 
  end

  def try_moving(player)
    sign_x = 1
    sign_y = 1

    sign_x = -1 if player.x < @x
    sign_y = -1 if player.y > @y

    move_x = sign_x * 1
    move_y = sign_y * 1 

    unless @last_move_x   
      new_x = @x + move_x
      if @game.is_allowed?(new_x, @y)
        @x = new_x
        @last_move_x = true
      end
    else
      new_y = @y - move_y
      if @game.is_allowed?(@x, new_y)
        @y = new_y
        @last_move_x = false
      end
    end
  end

  def char
    "Z"
  end

  def color
    Curses::COLOR_GREEN
  end

end

class SmartZombie < Zombie

  def initialize(game)
    @hp = 10
    @ticks_needed = 20
    super
  end

  def char
    'S'
  end
end

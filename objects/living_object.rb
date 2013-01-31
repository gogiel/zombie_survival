module LivingObject
  def self.included(base)
    base.class_eval do
      attr_accessor :hp, :x, :y, :ticks_needed, :last_tick_count
    end
  end

  def can_move?(ticks)
    @last_tick_count + @ticks_needed < ticks
  end

  def alive?
    hp > 0
  end

  def hit
    self.hp -= 1
  end
end
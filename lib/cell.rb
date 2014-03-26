class Cell
  attr_accessor :state

  # alias_method  :isAlive?, :alive?

  def initialize(state: :dead)
    @state = state
  end

  def next_state(neighbors)
    case neighbors
    when 0..1
      @state = :dead
    when 2
      @state
    when 3
      @state = :live
    end
  end

  def alive?
    @state == :live
  end

end

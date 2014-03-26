class Cell
	def initialize
		@state = false
		@action = false
	end

	def alive?
		@state
	end

	def dead?
		@state == false
	end

	def activate
		@action = true
	end

  def kill
    @action = false
  end

  def persist
    @action = @state
  end

	def update
		@state = @action
	end
end
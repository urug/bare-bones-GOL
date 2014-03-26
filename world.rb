require_relative 'cell'

class World

	def initialize(width, height)
		@max_width = width
		@max_height = height

		@cells = Matrix.build(width, height) { Cell.new }

		# Seed from a file with coordinates
	end

	def tick
		0.upto(@max_width) do |x|
			0.upto(@max_height) do |y|
				cell = cells[x][y]
				count = alive_neighbors(x,y)

				if cell.alive?
					if count < 2 || count > 3
						cell.kill
					else
						cell.persist
					end
				elsif count == 3
					cell.activate
				else
					cell.persist
				end
			end
		end

		update_cells
	end

	def alive_neighbors
		neighbors = []

		neighbors << cells[x - 1, y + 1].alive?
		neighbors << cells[]

	end

	def update_cells
	end
end
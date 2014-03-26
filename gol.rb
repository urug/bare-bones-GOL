require "./lib/cell.rb"

require "pry"

class Board

  def draw(drawer)
    # iterate all the cells in your game board that need to be drawn

      # draw the cell using this signature from the drawing library
      #     where x is the horizontal position and y is the vertical
      drawer.draw_point(x, y)

  end

  def cells(x, y, value)
    @cells[x][y] = value
  end

  def get_cells
    @cells
  end

  def initialize(_x, _y)
    @cells = []
    for y in -1.._y do
      arr = []
      for x in -1.._x do
        arr << Cell.new
      end
      @cells << arr
    end
  end

  def cell_count
    icnt = 0
    @cells.each do |cell|
      icnt += cell.length
    end
    icnt
  end

  def number_of_live_neighbors(x, y)
    icnt = 0

    icnt += 1 if @cells[y - 1][x - 1].isAlive?
    icnt += 1 if @cells[y - 1][x].isAlive?
    icnt += 1 if @cells[y - 1][x + 1].isAlive?
    icnt += 1 if @cells[y][x - 1].isAlive?
    #icnt += 1 if @cells[x + 1][y].isAlive?
    #icnt += 1 if @cells[x - 1][y + 1].isAlive?
    #icnt += 1 if @cells[x][y + 1].isAlive?
    #icnt += 1 if @cells[x + 1][y + 1].isAlive?
    icnt
  end
end





#require 'curses'
#require './gol.rb'
#require 'pry'
#
#Curses.init_screen()
#width = Curses.cols
#height = Curses.lines
#
#world = World.new(width, height)
#
#win = Curses::Window.new(0, 0, 0, 0)
#
#run = true
#win.clear
#win.box("|", "-")
#win.bkgd(" ")
#
#while run do
#  world.cells.each do |cell|
#    win.setpos(cell.location.y + 1, cell.location.x + 1)
#    win.delch()
#    win.insch("0")
#  end
#  world.tick
#  world.update_world
#  win.refresh
#
#  #sleep(1)
#end
#
#
#
#win.getch
#win.close
#

require "rspec"
require "./gol.rb"

describe Board do
  let (:cell_obj) {double(:cell_obj)}
  let (:cell_top_left) {double(:cell_top_left)}

  before :each do
    Cell = double()
    Cell.stub(:new).and_return cell_obj
    @brd = Board.new(8, 6)
  end
  it "should create a valid board" do
    @brd.nil?.should == false
  end

  it "board should have the correct number of cells" do
    @brd.cell_count.should == 80

    @brd = Board.new(5,5)
    @brd.cell_count.should == 49
  end

  describe "board should determine how many neighbors a cell has" do

    it "should return 0 for cell with no neighbors" do
      cell_obj.stub(:isAlive?).and_return false
      @brd.number_of_live_neighbors(1,1).should == 0
    end

    it "should return 1 if x-1, y-1 is alive" do
      cell_obj.stub(:isAlive?).and_return false
      cell_top_left.stub(:isAlive?).and_return true
      @brd.cells(0,0,cell_top_left)
      @brd.cells(0,1,cell_obj)
      @brd.cells(0,2,cell_obj)
      @brd.cells(1,0,cell_obj)
      @brd.cells(1,2,cell_obj)
      @brd.cells(2,0,cell_obj)
      @brd.cells(2,1,cell_obj)
      @brd.cells(2,2,cell_obj)

      @brd.number_of_live_neighbors(1, 1).should == 1
    end

    it "should return 1 if x, y-1 is alive" do
      cell_obj.stub(:isAlive?).and_return false
      cell_top_left.stub(:isAlive?).and_return true
      @brd.cells(0,0,cell_obj)
      @brd.cells(0,1,cell_top_left)
      @brd.cells(0,2,cell_obj)
      @brd.cells(1,0,cell_obj)
      @brd.cells(1,2,cell_obj)
      @brd.cells(2,0,cell_obj)
      @brd.cells(2,1,cell_obj)
      @brd.cells(2,2,cell_obj)

      @brd.number_of_live_neighbors(1, 1).should == 1
    end

    it "should return 1 if x + 1, y-1 is alive" do
      cell_obj.stub(:isAlive?).and_return false
      cell_top_left.stub(:isAlive?).and_return true
      @brd.cells(0,0,cell_obj)
      @brd.cells(0,1,cell_obj)
      @brd.cells(0,2,cell_top_left)
      @brd.cells(1,0,cell_obj)
      @brd.cells(1,2,cell_obj)
      @brd.cells(2,0,cell_obj)
      @brd.cells(2,1,cell_obj)
      @brd.cells(2,2,cell_obj)

      @brd.number_of_live_neighbors(1, 1).should == 1
    end

    it "should return 1 if x - 1, y is alive" do
      cell_obj.stub(:isAlive?).and_return false
      cell_top_left.stub(:isAlive?).and_return true
      @brd.cells(0,0,cell_obj)
      @brd.cells(0,1,cell_obj)
      @brd.cells(0,2,cell_obj)
      @brd.cells(1,0,cell_top_left)
      @brd.cells(1,2,cell_obj)
      @brd.cells(2,0,cell_obj)
      @brd.cells(2,1,cell_obj)
      @brd.cells(2,2,cell_obj)

      @brd.number_of_live_neighbors(1, 1).should == 1
    end
    #
    #it "should return 1 if x, y-1 is alive" do
    #  cell_obj.stub(:isAlive?).and_return false
    #  cell_top_left.stub(:isAlive?).and_return true
    #  @brd.cells(0,0,cell_obj)
    #  @brd.cells(0,1,cell_top_left)
    #  @brd.cells(0,2,cell_obj)
    #  @brd.cells(1,0,cell_obj)
    #  @brd.cells(1,2,cell_obj)
    #  @brd.cells(2,0,cell_obj)
    #  @brd.cells(2,1,cell_obj)
    #  @brd.cells(2,2,cell_obj)
    #
    #  @brd.number_of_live_neighbors(1, 1).should == 1
    #end
    #
    #it "should return 1 if x, y-1 is alive" do
    #  cell_obj.stub(:isAlive?).and_return false
    #  cell_top_left.stub(:isAlive?).and_return true
    #  @brd.cells(0,0,cell_obj)
    #  @brd.cells(0,1,cell_top_left)
    #  @brd.cells(0,2,cell_obj)
    #  @brd.cells(1,0,cell_obj)
    #  @brd.cells(1,2,cell_obj)
    #  @brd.cells(2,0,cell_obj)
    #  @brd.cells(2,1,cell_obj)
    #  @brd.cells(2,2,cell_obj)
    #
    #  @brd.number_of_live_neighbors(1, 1).should == 1
    #end
    #
    #it "should return 1 if x, y-1 is alive" do
    #  cell_obj.stub(:isAlive?).and_return false
    #  cell_top_left.stub(:isAlive?).and_return true
    #  @brd.cells(0,0,cell_obj)
    #  @brd.cells(0,1,cell_top_left)
    #  @brd.cells(0,2,cell_obj)
    #  @brd.cells(1,0,cell_obj)
    #  @brd.cells(1,2,cell_obj)
    #  @brd.cells(2,0,cell_obj)
    #  @brd.cells(2,1,cell_obj)
    #  @brd.cells(2,2,cell_obj)
    #
    #  @brd.number_of_live_neighbors(1, 1).should == 1
    #end
    #
    #it "should return 1 if x, y-1 is alive" do
    #  cell_obj.stub(:isAlive?).and_return false
    #  cell_top_left.stub(:isAlive?).and_return true
    #  @brd.cells(0,0,cell_obj)
    #  @brd.cells(0,1,cell_top_left)
    #  @brd.cells(0,2,cell_obj)
    #  @brd.cells(1,0,cell_obj)
    #  @brd.cells(1,2,cell_obj)
    #  @brd.cells(2,0,cell_obj)
    #  @brd.cells(2,1,cell_obj)
    #  @brd.cells(2,2,cell_obj)
    #
    #  @brd.number_of_live_neighbors(1, 1).should == 1
    #end

  end



end

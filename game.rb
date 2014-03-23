require './gol.rb'
require './drawer.rb'

# example file to show usage of drawing library interface etc...

class Game 
 def initialize
   @world = World.new

   @drawer = Drawer.new(@world, cellsize: 10)
   @drawer.show
 end

end

game = Game.new

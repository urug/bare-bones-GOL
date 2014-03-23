Conway's Game of Life
======================

For a coding exercise we wanted to create a challenge that is a team undertaking.  The Game of life
rules etc can be found on the internet and is pretty straight-forward.
[GOL Rules Here](http://en.wikipedia.org/wiki/Conway's_Game_of_Life)

What we want to happen during this meeting is for the teams to actually finish an implementation
of the game and review their experience working together: delegating responsibilities,
mentoring new developers in the process, testing and validating the code, etc.

The idea is for each to be a self-organizing entity and tackle the problem in any way they see fit.

Warning:
-------
there may be a curve ball or so thrown into the mix during the exercise. We want to
simulate some things that we see as professional devs day in and day out - so be prepared!

We have provided a gosu-based library to display the GOL on our group machine so the attendees
can see the results at the end of the exercise and discuss things like performance etc.  We also have a
couple loader files to populate a game board with preset patterns etc so we can see some of
the different GOL patterns etc.

There are 3 requirements:
-------------------------
    1.  build your solution to use the Gosu Library to display your game board
    2.  use the loader file format as a command line param so the sample data can be used to populate the game
    3.  Have fun!

you may build tests or not, use TDD or not, etc.  However the team decides they want to solve the
problem: it's up to you!

NOTE:
-----
the game spec says the GOL uses and infinite playing field.  Our display library is a finite
board (which you can specify the size for) so this requirement is NOT relevant for our version.  You
can build an infinite sized solution if you like, but the display will only show the size you specify when you
initialize the game board OR the default size of 800 x 600 pixels.  the cells will not wrap around the board...


- - -

Use the gosu library for the display (developed by Max and Matt Nielsen)
to run the game just enter the following from a command prompt in the directory:

ruby game.rb test_seed

once the game is running the 'esc' key will end it.


the included game.rb file shows the basic format (you can just use this game file if you like as is)

The included gol.rb file shows the pseudo code for the bare minimum to use the drawing library we've provided

I used rvm to specify the gems etc with ruby-2.0.0-p247

my gem list looks like the following, feel free to use whatever gems you want instead (other than gosu etc)
*** LOCAL GEMS ***

- bundler (1.3.5)
- coderay (1.1.0)
- diff-lcs (1.2.5)
- gem-wrappers (1.2.4)
- gosu (0.7.50)
- method_source (0.8.2)
- pry (0.9.12.6)
- rake (10.1.0)
- rspec (2.14.1)
- rspec-core (2.14.7)
- rspec-expectations (2.14.5)
- rspec-mocks (2.14.5)
- rvm (1.11.3.9)
- slop (3.4.7)








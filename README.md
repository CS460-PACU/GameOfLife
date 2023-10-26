# Game Of Life!

### Description:
You will implement a multithreaded version of John Conway’s Game of Life.  The Game of Life is a simulation of organisms living, dying, and being born on a grid as described by the four rules:

   1. Any live cell with fewer than two live neighbours dies, as if by loneliness.
   2. Any live cell with more than three live neighbours dies, as if by overcrowding.
   3. Any live cell with two or three live neighbours lives, unchanged, to the next generation.
   4. Any dead cell with exactly three live neighbours comes to life.

Each rule is applied instantaneously at a generation. That means that the result of a rule does not affect other organisms until the following generation. 
http://en.wikipedia.org/wiki/Conway's_Game_of_Life


### Your Program:
Your program will read command line options to determine the input and output files, as well as the number of threads and number of generations to run.  See the file format section below.   The input and output files have the same format. The height and width of the board are not necessarily equal.

Immediately before writing the game board back to a file, display the total number of births and total  number of deaths that occurred over all generations. You also need to display the time, in nanoseconds, your program took to run all the generations.  This time must not include any File I/O.  Use clock_gettime() with the CLOCK_REALTIME clk_id to use the high resolution timer.

Your program will need to run each generation using multiple threads.  For n threads, each thread must do (about) 1/n of the total work.  By using more than one thread the runtime of your program must decrease if you are using a multicore processor.

How you divide up the work among the threads is your design decision.  There are many correct ways to do this and any that achieves a speed up and produces a correct answer will be acceptable.

```
	bin/main inputFile outputFile #Threads #Generations [-X] [-F]
 ```
  
If the -X option is not given to the program, display, for each generation, the total number of births and deaths for that generation.  You must always display the time your program took to run all the generations

If the -F option is given to the program, do not write data to the output file.

### File Format

boardwidth
boardheight  
boardwidth digits per row, boardheight rows

A 0 indicates an empty spot, a 1 indicates a spot with an organism in it.


### Sample Output
```
coffee$ bin/main testcases/smallGame.life testcases/smallGame.gen3.life 4 3
Generation 1:	DEATHS: 81756	BIRTHS: 29611
Generation 2:	DEATHS: 25944	BIRTHS: 15480
Generation 3:	DEATHS: 14429	BIRTHS: 12456

TOTAL DEATHS: 122129	TOTAL BIRTHS: 57547

Time: 70,372,179 nanoseconds

coffee$ bin/main testcases/smallGame.life testcases/smallGame.gen3.life 4 3 -X

TOTAL DEATHS: 122129	TOTAL BIRTHS: 57547

Time: 70,372,179 nanoseconds 
```


## Getting Sample Game Boards and expected output

http://zeus.cs.pacificu.edu/chadd/CS460/game_of_life_testcases.tar.gz

This file extracts to the directory testcases/

Get testcases with:
```
make getTestcases
```

Run the test case with:
```
make runSmallTest1Gen
```

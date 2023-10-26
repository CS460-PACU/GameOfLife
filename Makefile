#############################################################################
# File name:  Makefile
# Author:     chadd williams
# Date:       Sept 1, 2021
# Class:      CS360
# Assignment: 
# Purpose:    
#############################################################################

all: bin bin/main

bin:
	mkdir -p bin

# be sure to add -pthread to LINK step

bin/main: bin bin/main.o
	gcc -o bin/main -g -Wall bin/main.o -pthread

bin/main.o: src/main.c
	gcc -c -o bin/main.o -g -Wall src/main.c

valgrind: bin/main
	valgrind -v --leak-check=yes --track-origins=yes --leak-check=full --show-leak-kinds=all bin/main

printMain:
	enscript -C -T 2 -p - -M Letter -Ec --color -fCourier8 src/main.c  | ps2pdf - bin/main.pdf

getTestcases:
	wget http://zeus.cs.pacificu.edu/chadd/CS460/game_of_life_testcases.tar.gz
	tar zxf game_of_life_testcases.tar.gz
	rm game_of_life_testcases.tar.gz
	
runSmallTest1Gen: bin/main
	bin/main testcases/smallGame.life testcases/smallGame_1gen.out 1 1
	@echo differences bewteen expected output and your output:
	@echo -Start-
	diff -Bw testcases/smallGame_1gen.expected testcases/smallGame_1gen.out
	@echo -End-
	
clean:
	rm -f bin/main bin/*.o

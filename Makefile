# Makefile for compiling elk.c and main.c with -DJS_DUMP flag

CC = clang
CXX = clang++
CFLAGS = -DJS_DUMP -O3 -g -fsanitize=fuzzer,address

all: elk

elk: elk.o main.o
	$(CC) $(CFLAGS) $^ -o $@

elk.o: elk.c
	$(CC) $(CFLAGS) -c $< -o $@

main.o: main.cpp
	$(CXX) $(CFLAGS) -c $< -o $@

clean:
	rm -f *.o elk

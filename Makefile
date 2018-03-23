all: factorial hello test

print_number.o: print_number.s
	as print_number.s -o print_number.o

factorial: factorial.o
	ld factorial.o -o factorial

factorial.o: factorial.s
	as factorial.s -o factorial.o

hello: hello.o print_number.o
	ld hello.o print_number.o -o hello

hello.o: hello.s
	as hello.s -o hello.o

test: test.o
	ld test.o -o test

test.o: test.s
	as test.s -o test.o

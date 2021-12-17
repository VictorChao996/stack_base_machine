all:
		bison -d -o stack.tab.c stack.y
		gcc -c -g -I.. stack.tab.c 
		flex -o lex.yy.c stack.l
		gcc -c -g -I.. lex.yy.c
		gcc -o stackMachine stack.tab.o lex.yy.o -ll
clean:
		rm -rf *o stackMachine
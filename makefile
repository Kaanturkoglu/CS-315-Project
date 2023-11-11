all: parser clean
parser: b.l yacc.y
	lex b.l
	yacc yacc.y
	gcc -o parser y.tab.c
clean:
	-rm -f *.output lex.yy.c *.tab.* *.o
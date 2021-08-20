all:
	lex parser.l
	yacc parser.y
	gcc y.tab.c -ll -ly

clean:
	rm -rf lex.yy.c a.out
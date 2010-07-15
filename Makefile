all: calc wc

wc:
	flex wc.l
	gcc -o bin/$@ lex.yy.c -lfl
calc: calc.l calc.y
	bison -d calc.y
	flex calc.l
	gcc -o bin/$@ calc.tab.c lex.yy.c -lfl

sgte:
	flex sgte.l
	gcc -o bin/$@ lex.yy.c -lfl

clean:
	rm a.out calc.tab.* lex.yy.c bin/wc bin/calc bin/sgte
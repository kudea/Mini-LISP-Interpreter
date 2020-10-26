all:
	bison -d lsp.y
	flex lsp.l
	g++ lex.yy.c lsp.tab.c
test: all
	./a.out < input.txt
	make clean

clean:
	rm lex.yy.c lsp.tab.c lsp.tab.h
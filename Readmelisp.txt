----------------Features-------------------------
Syntax Validation
Print
Numerical Operations
Logical Operations
if Expression
Variable Definition

----------------makefile-------------------------
#compile bison
bison -d -o y.tab.c lisp.y	
gcc -c -g -I.. y.tab.c
#compile flex
flex -o lex.yy.c lisp.l
gcc -c -g -I.. lex.yy.c
#compile and link bison and flex
gcc -o lisp y.tab.o lex.yy.o -ll
------------------說明-----------------------
此為初始版本
尚未寫入function功能前
由於function 功能 繁瑣
先放上原始檔案保存
以lex+yacc做編譯
在有  lisp.y   lisp.l   t.txt 的情況下
./lisp < t.txt
就可以執行程式
更改 t.txt來做test

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
------------------����-----------------------
������l����
�|���g�Jfunction�\��e
�ѩ�function �\�� �c��
����W��l�ɮ׫O�s
�Hlex+yacc���sĶ
�b��  lisp.y   lisp.l   t.txt �����p�U
./lisp < t.txt
�N�i�H����{��
��� t.txt�Ӱ�test

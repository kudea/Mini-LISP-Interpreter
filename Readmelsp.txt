----------------Features-------------------------
Syntax Validation
Print
Numerical Operations
Logical Operations
if Expression
Variable Definition
Function
Named Function
----------------makefile-------------------------
all:
	
bison -d lsp.y
	
flex lsp.l
	
g++ lex.yy.c lsp.tab.c

test: all
	
./a.out < input.txt
	
make clean


clean:
	
rm lex.yy.c lsp.tab.c lsp.tab.h

------------------����-----------------------
������s����
�{���j���
�[�Jnode tree
�غc�X���㪺traverseAST�l��
����function���\��
�Hy.cpp���sĶ
�b��  lsp.y   lsp.l   main.h 	input.txt �M  makefile �����p�U
make test
�N�i�H����{��
��� input.txt�Ӱ�test

�ɤW�y�{
sudo mkdir /home/user/Desktop/share
sudo mount.vboxsf share /home/user/Desktop/share
ls /home/user/Desktop/share
cd /home/user/Desktop/share
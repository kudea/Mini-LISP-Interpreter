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

------------------說明-----------------------
此為更新版本
程式大改動
加入node tree
建構出完整的traverseAST子樹
完成function之功能
以y.cpp做編譯
在有  lsp.y   lsp.l   main.h 	input.txt 和  makefile 的情況下
make test
就可以執行程式
更改 input.txt來做test

補上流程
sudo mkdir /home/user/Desktop/share
sudo mount.vboxsf share /home/user/Desktop/share
ls /home/user/Desktop/share
cd /home/user/Desktop/share
%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void yyerror(const char *message){
	printf("syntax error\n");
}
extern int yylex();
int cmp, notEqu=0;
typedef struct var{
	char* name;
	int value;
}Var;
Var varArray[100];
int Index=0;
%}
%union{
	int ival;
	char* word;
}
%token <ival> inum mod printNum printBool And Or Not bval IF Def
%token <word> ID
%type <ival> exp printStmt NumOp plus minus multiply divide expsPlus expsMul modulus greater smaller equal expsEqu andOp orOp notOp LogOp expsAnd expsOr ifExp testExp thenExp elseExp defStmt
%type <word> variable
%%
program		:program stmt
			|
			;
stmt		:exp
			|printStmt
			|defStmt
			;
printStmt	:'(' printNum exp ')'		{ printf("%d\n", $3); }
			|'(' printBool exp ')'		{ 
											switch(cmp){
												case 1:
												case 3:
												case 5:
													printf("#t\n");
													break;
												case 2:
												case 4:
												case 6:
													printf("#f\n");
													break;
											}
											if($3==1)
												printf("#t\n");
											else
												printf("#f\n");
										}
			;
exp			:inum
			|bval
			|NumOp
			|LogOp
			|ifExp
			|variable					{
											int i;
											for(i=0;i<Index;i++){
												if(!strcmp(varArray[i].name, $1)){
													$$ = varArray[i].value;
												}
											}
										}
			;
NumOp		:plus
			|minus
			|multiply
			|divide
			|modulus
			|greater
			|smaller
			|equal
			;
plus		:'(' '+' exp expsPlus ')'	{ $$ = $3 + $4; }
			;
expsPlus	:exp expsPlus				{ $$ = $1 + $2; }
			|exp						{ $$ = $1; }
			;
minus		:'(' '-' exp exp ')'		{ $$ = $3 - $4; }
			;
multiply	:'(' '*' exp expsMul')'		{ $$ = $3 * $4; }
			;
expsMul		:exp expsMul				{ $$ = $1 * $2; }
			|exp						{ $$ = $1; }
			;
divide		:'(' '/' exp exp ')'		{ $$ = $3 / $4; }
			;
modulus		:'(' mod exp exp ')'		{ $$ = $3 % $4; }
			;
greater		:'(' '>' exp exp ')'		{
											if($3>$4){
												cmp = 1;
												$$ = 1;
											}
											else{
												cmp = 2;
												$$ = 0;
											}
										}
			;
smaller		:'(' '<' exp exp ')'		{
											if($3<$4){
												cmp = 3;
												$$ = 1;
											}
											else{
												cmp = 4;
												$$ = 0;
											}
										}
			;
equal		:'(' '=' exp expsEqu ')'	{
											if($3==$4 && notEqu==0){
												cmp = 5;
												$$ = 1;
											}
											else{
												cmp = 6;
												$$ = 0;
											}

											notEqu = 0;
										}
			;
expsEqu		:exp expsEqu				{
											if($1!=$2)
												notEqu = 1;
										}
			|exp
			;
LogOp		:andOp
			|orOp
			|notOp
			;
andOp		:'(' And exp expsAnd ')'	{ $$ = $3 & $4; cmp=0; }
			;
expsAnd		:exp expsAnd				{ $$ = $1 & $2; }
			|exp						{ $$ = $1; }
			;
orOp		:'(' Or exp expsOr ')'		{ $$ = $3 | $4; cmp=0; }
			;
expsOr		:exp expsOr					{ $$ = $1 | $2; }
			|exp						{ $$ = $1; }
			;
notOp		:'(' Not exp ')'			{ $$ = !$3; cmp=0; }
			;
ifExp		:'(' IF testExp thenExp elseExp ')'	{
													if($3==1)
														$$ = $4;
													else
														$$ = $5;
												}
			;
testExp		:exp
			;
thenExp		:exp
			;
elseExp		:exp
			;
defStmt		:'(' Def variable exp ')'	{
											varArray[Index].name = $3;
											varArray[Index].value = $4;
											Index++;
										}
			;
variable	:ID							{ $$ = $1; }
			;
%%
int main(){
	yyparse();
	return 0;
}

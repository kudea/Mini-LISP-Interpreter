%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "y.tab.h"
%}
separator	[ \t\n\r]*
digit		[0-9]
number		0|[1-9]{digit}*|-[1-9]{digit}*
letter		[a-z]
id			{letter}[{letter}{digit}-]*
%%
{separator}		;
[+\-*/()><=]	{ return yytext[0]; }
"print-num"		{ return printNum; }
"print-bool"	{ return printBool; }
"mod"			{ return mod; }
"and"			{ return And; }
"or"			{ return Or; }
"not"			{ return Not; }
"if"			{ return IF; }
"define"		{ return Def; }
"#t"			{ yylval.ival = 1; return bval; }
"#f"			{ yylval.ival = 0; return bval; }
{number}		{ yylval.ival = atoi(yytext); return inum; }
{id}			{ yylval.word = strdup(yytext); return ID; }
.				;
%%

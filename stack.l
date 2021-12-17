%option noyywrap
%{
#include "stack.tab.h"
%}
NUMBER [0-9]+

%%
"add" {return ADD;}
"sub" {return SUB;}
"mul" {return MUL;}
"mod" {return MOD;}
"inc" {return INC;}
"dec" {return DEC;}
"load" {return LOAD;}
\n {}
[ \t]+ {/*do nothing*/}
{NUMBER} {
    yylval.intVal = atoi(yytext);
    return(NUMBER);
}
%%

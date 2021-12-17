%{
#include<stdio.h>
#include<string.h>
int yylex();
void yyerror(const char *message);
/*
stack_top: point at the top of the stack
judge: some conditions will make this boolean value become false, such as add while stack size is lower 
            than two.
*/
int stack_top = -1,judge = 1;
int stack[30];
%}
%union{
    int intVal;
}
%token ADD SUB MUL MOD INC DEC LOAD
%token <intVal> NUMBER
%type <intVal> expr

%%
/*Bottom up until reduce the start symbol : all*/
all : line 
{
    /*As the PDF mention, EOF with more than one element in the stack is Invalid*/
    if(judge == 1 && stack_top == 0)
    {
        printf("%d\n", stack[stack_top]);
    }
    else
    {
        printf("Invalid format\n");
    }
};
line : expr line {/* do nothing*/}
        |
        ;
expr : LOAD NUMBER { stack_top++; stack[stack_top] = $2; }
    |  ADD 
    {
        if(stack_top >= 1)
        {
           stack[stack_top-1] = stack[stack_top] + stack[stack_top-1];
            stack_top--;
        }else
        {
            judge = 0;    
        }
    }
    |  SUB 
    {
        if(stack_top >= 1)
        {
            stack[stack_top-1] = stack[stack_top] - stack[stack_top-1];
            stack_top--;
        }
        else
        {
            judge = 0;
        }
    }
    |  MUL 
    {
        if(stack_top >= 1)
        {
            stack[stack_top-1] = stack[stack_top] * stack[stack_top-1];
            stack_top--;
        }
        else
        {
            judge = 0;
        }
    }
    |  MOD 
    {
        if(stack_top >= 1)
        {
            stack[stack_top-1] = stack[stack_top] % stack[stack_top-1];
            stack_top--;
        }
        else
        {
            judge = 0;
        }
    }
    |  INC {if(stack_top >= 0){stack[stack_top]++;} else{judge = 0;}}
    |  DEC {if(stack_top >= 0){stack[stack_top]--;} else{judge = 0;}}
    ;
%%
void yyerror(const char *message)
{
    fprintf (stderr, "%s\n",message);
}
int main(int argc, char *argv[]){
    stack[0] = 52;
    yyparse();
    return(0);
}
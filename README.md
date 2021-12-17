# stack_base_machine
Compiler Homework- Domjudge HW3_1  
The detail desciption is in Stack-Base Machine.pdf
## How to run
Using "make" instruction to generate the executable file for stack_base_machine.  
The instruction in the **MakeFile** will generate the compile file from .l file and .y file, and make these compile file into an executable file

## Desciption
Stack-base machine is a kind of CPU design architecture which sometimes be compared with 
register-based machine. Unlike register-based machine which used 3 address code taking 1 
opcode and 2 corresponding operands e.g. add %eax, 3, stack based machine was designed 
with opcode with one or zero operand and one long stack which served as registers to take 
temporary value in calculation.  

## Problem detail
In this problem, you will be given a program for stack-based machine. You need to write a 
yacc program to check if the format of the program and evaluate its result. The instruction set 
of our machine are: “add”, “sub”, “mul”, “mod” which will pop 2 operands from stack then 
perform addition, subtraction, multiplication and modulation and push back the result, “inc”, 
“dec” which will pop 1 operand from stack then perform increased by 1, decreased by 1, then 
push back the result, “load <number>” which will push a constant <number> on the top of 
the stack.

## Sample Input & Output
### Input_EX1
load 1  
load 2  
sub  
load 5  
mod
### Output_EX1
0
### Explanation_EX1
5% (2-1) = 0
### Input_EX2
load 3  
load 4  
load 5  
add  
inc  
inc  

### Output_EX2
Invalid format
### Explanation_EX2
If after finish the program, there are more than 1 numbers in the stack it will be consider invalid.

### Input_EX3
load 1  
load 1  
add  
sub  
### Output_EX3
Invalid format
### Explanation_EX3
No enough operands in stack to perform sub.

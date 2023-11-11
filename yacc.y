%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(char* s);
extern int yylineno;
%}

%token PLUS
%token DIGIT
%token FLOAT
%token INT
%token IDENTIFIER
%token COMMENT
%token OROP
%token ANDOP
%token EQUAL
%token ASSIGN
%token NOT
%token MINUS
%token DIV
%token MULT
%token EXPONENT
%token MOD
%token INCREASE
%token DECREASE
%token IF
%token ELSE
%token FOR
%token WHILE
%token FUNCT
%token LP
%token RP
%token LB
%token RB
%token LSB
%token RSB
%token SC
%token COMMA
%token MULTILINE_COMMENT
%token DOT
%token GREATER_THAN
%token LESS_THAN
%token GRE_OR_EQU
%token LES_OR_EQU
%token NOT_EQUAL
%token TRUE
%token FALSE
%token YE
%token TUKUR
%token BOOL_DEF
%token FLOAT_DEF
%token INTEGER_DEF
%token KOVA_DEF
%token DON
%token KASIK
%token BICAK

%left ANDOP
%left OROP
%left NOT

%%		

program : KASIK statements BICAK
statements : statement | statement statements

statement : assignment_statement 
       | condition_statement 
       | loop_statement 
       | input_statement
       | output_statement
       | comment_statement
       | update_statement
       | function_statement
       | return_statement
       | function_call
       | block
       | SC 

return_statement: DON expression | DON function_call

loop_statement : for_statement
       | while_statement
              
block : LB statements RB | LB RB
function_call : function_name LP function_expression_list RP
function_expression_list : expression | expression COMMA expression

variable_type : BOOL_DEF | FLOAT_DEF | INTEGER_DEF | KOVA_DEF | KOVA_DEF LESS_THAN variable_type GREATER_THAN

boolean_var : TRUE | FALSE
int_var : INT
float_var : FLOAT

identifier : IDENTIFIER
variable_name : identifier 
variable : variable_type variable_name

expression : expression PLUS term | expression MINUS term
       | term
term : term MULT power | term DIV power
       | power
power : power EXPONENT factor | mod
mod : mod MOD factor | factor
factor : LP expression RP
       | item

item : variable_name | constant | kova

constant : boolean_var | int_var | float_var

update_statement : variable_name DECREASE | variable_name INCREASE

assignment_statement : variable ASSIGN expression | variable_name ASSIGN expression

kova_items: expression | expression COMMA kova_items
kova : LSB kova_items RSB

conditions : conditions ANDOP conditions
          | conditions OROP conditions
          | NOT conditions
          | boolean_var
          | variable_name
          | LB conditions RB
          | expression comparison_operator expression
          


condition_statement : IF LP conditions RP block
       | IF LP conditions RP block ELSE condition_statement
       | IF LP conditions RP block ELSE block
       

comparison_operator : EQUAL 
       | NOT_EQUAL
       | GREATER_THAN
       | LESS_THAN
       | GRE_OR_EQU
       | LES_OR_EQU

for_statement : FOR LP assignment_statement SC conditions SC update_statement RP block | FOR LP assignment_statement SC conditions SC assignment_statement RP block
while_statement : WHILE LP conditions RP block

input_statement: YE LP variable_name RP
output_statement : TUKUR LP expression RP
comment_statement : inline_comment | multiline_comment
inline_comment : COMMENT
multiline_comment : MULTILINE_COMMENT

function_statement : FUNCT function_name function_body block
function_name : variable_name
function_variable_list : variable | variable COMMA function_variable_list
function_body : LP RP
       | LP function_variable_list RP

%%
#include "lex.yy.c"
void yyerror(char *s) {
	fprintf(stdout, "line %d: %s\n", yylineno,s);
}

int main() {
	int error = yyparse();
	if (error == 0) {
		printf("Input program is valid.\n");
	}
 	return error;
}
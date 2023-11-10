%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(char* s);
extern int yylineno;
%}

%token PLUS
%token SIGN
%token SPACE
%token ALPHABETIC
%token DIGIT
%token FLOAT
%token CHAR
%token BOOL
%token INT
%token IDENTIFIER
%token STRING
%token ARRAY_IDENT
%token COMMENT
%token MULTILINE_COMMENT
%token NL
%token WS
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
%token GREATER_THAN
%token LESS_THAN
%token GRE_OR_EQU
%token LES_OR_EQU
%token NOT_EQUAL
%token TRUE
%token FALSE
%token YE
%token SIC
%token BOOL_DEF
%token CHAR_DEF
%token STRING_DEF
%token FLOAT_DEF
%token INTEGER_DEF
%token DON

%%

program : kasik statements bicak
statements : statement | statement statements
statement : assignment_statement 
       | condition_statement 
       | loop_statement 
       | input_statement
       | output_statement
       | comment_statement
       | function_statement
       | function_call
       | block
       | SC

loop_statement : for_statement
       | while_statement
              
              
block : LB statements RB | LB statements don expression RB
function_call : function_name LP function_expression_list RP
function_expression_list : expression | expression COMMA expression

variable_type : BOOL | float | integer
any_char : letter | digit | symbol | whitespace

boolean_var : TRUE | FALSE

signless_int : digit | digit signless_int
int_var : PLUS signless_int | MINUS signless_int | signless_int

digit_sequence : digit | digit digit_sequence
signless_float : digit_sequence . digit_sequence
float_var : PLUS signless_float | MINUS signless_float | signless_float

identifier : letter | digit
variable_name_long : identifier | identifier variable_name_long
variable_name : letter | letter variable_name_long
variable : variable_type variable_name


collection : LSB integer_list RSB
       | LSB string_list RSB
       | LSB float_list RSB
       | LSB char_list RSB
       | LSB boolean_list RSB

integer_list : integer | integer_list COMMA integer
float_list : integer | float_list COMMA integer
char_list : integer | char_list COMMA integer
boolean_list : integer | boolean_list COMMA integer


expression : expression PLUS term | expression MINUS term
       | term
term : term MULT power | term DIV power
       | power
power : power EXPONENT factor | factor
factor : LP expression RP
       | item

item : variable_name | constant

constant : char_var | boolean_var | string_var | int_var | float_var

update_statement : expression INCREASE
       | expression DECREASE

assignment_statement : variable EQUAL expression;  

condition_expression : expression comparison_operator expression
       | LP condition RP
       | condition AND condition
       | condition OR condition
       | NOT condition
       | boolean_var


condition_statement : if LP condition_expression RP block
       | LP condition_expression RP statements else statements


for_statement : for LP assignment_st SC condition_expression SC update_statement RP block
while_statement : while LP condition_expression RP block



input_statement: cinLP variable_name RP
output_statement : tukurLP string_varRP | tukurLP variable_nameRP


comment_statement : inline_comment | multiline_comment 
inline_comment : COMMENT text
multiline_comment : CM_OPEN text CM_CLOSE


function_statement : function function_name  function_body RP block 
function_name : variable_name
function_variable_list : variable | variable COMMA function_variable_list
function_body : LPRP
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
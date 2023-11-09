%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(char* s);
extern int yylineno;
%}

%token SIGN
%token ALPHABETIC
%token DIGIT
%token IDENTIFIER
%token BOOLEAN
%token STRING
%token COMMENT
%token NL
%token CONST
%token OROP
%token ANDOP
%token EQUAL
%token ASSIGN
%token NOT
%token PLUS
%token MINUS
%token DIV
%token EXPONENT
%token MOD
%token IF
%token ELSE
%token FOR
%token DO
%token WHILE
%token LP
%token RP
%token SC
%token GREATER_THAN
%token LESS_THAN
%token TRUE
%token FALSE

%%



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
%option main

SIGN [+-]
SPACE [ ]
ALPHABETIC [A-Za-z]
DIGIT [0-9]
FLOAT [-+]?[0-9]*\.?[0-9]+?
CHAR \'[^\']\'
BOOL {TRUE}|{FALSE}
INT {SIGN}?{DIGIT}+
IDENTIFIER {ALPHABETIC}({ALPHABETIC}|{DIGIT})*
STRING \"[^\"\n]*\"
ARRAY_IDENT \[\]
ARRAY_INT \[{SPACE}?{INT}+({SPACE}?{COMMA}{SPACE}?{INT}+{SPACE}?)*\]
ARRAY_FLOAT \[{SPACE}?{FLOAT}+({SPACE}?{COMMA}{SPACE}?{FLOAT}+{SPACE}?)*\]
ARRAY_BOOL \[{SPACE}?{BOOL}+({SPACE}?{COMMA}{SPACE}?{BOOL}+{SPACE}?)*\]
ARRAY_CHAR \[{SPACE}?{CHAR}+({SPACE}?{COMMA}{SPACE}?{CHAR}+{SPACE}?)*\]
ARRAY_STRING \[{SPACE}?{STRING}+({SPACE}?{COMMA}{SPACE}?{STRING}+{SPACE}?)*\]
COMMENT \/\/
NL \n
WS [ \t\r\f\v]+
OROP \|\|
ANDOP \&\&
EQUAL \=\=
ASSIGN \=
NOT \!
PLUS \+
MINUS \-
DIV \/
MULT \*
EXPONENT \^
MOD \%
INCREASE \+\+
DECREASE \-\-
IF if
ELSE else
FOR for
WHILE while
FUNCT function
LP \(
RP \)
LB \{
RB \}
LSB \[ 
RSB \]
SC \;
COMMA \,
GREATER_THAN \>
LESS_THAN \<
GRE_OR_EQU \>\=
LES_OR_EQU \<\=
NOT_EQUAL \!\=
TRUE true
FALSE false
YE ye
SIC sic
BOOL_DEF bool 
CHAR_DEF char 
STRING_DEF string 
FLOAT_DEF float 
INTEGER_DEF int
RETURN don

%%

{ARRAY_IDENT} printf("ARRAY_IDENT ");
{INT} printf("INT ");
{RETURN} printf("RETURN ");
{OROP} printf("OR ");
{ANDOP} printf("AND ");
{EQUAL} printf("EQUAL ");
{NOT} printf("NOT ");
{PLUS} printf("PLUS ");
{MINUS} printf("MINUS ");
{DIV} printf("DIV ");
{MULT} printf("MULT ");
{EXPONENT} printf("EXPO ");
{COMMENT} printf("COMMENT ");
{MOD} printf("MOD ");
{IF} printf("IF ");
{ELSE} printf("ELSE ");
{FOR} printf("FOR ");
{WHILE} printf("WHILE ");
{FUNCT} printf("FUNCTION ");
{LP} printf("LP ");
{RP} printf("RP ");
{LB} printf("LB ");
{RB} printf("RB ");
{LSB} printf("LSB ");
{RSB} printf("RSB ");
{SC} printf("SC ");
{COMMA} printf("COMMA ");
{YE} printf("INPUT ");
{SIC} printf("OUTPUT ");
{GREATER_THAN} printf("GREATER_THAN ");
{LESS_THAN} printf("LESS_THAN ");
{GRE_OR_EQU} printf("GRE_OR_EQU ");
{LES_OR_EQU} printf("LES_OR_EQU ");
{NOT_EQUAL} printf("NOT_EQUAL ");
{TRUE} printf("TRUE ");
{FALSE} printf("FALSE ");
{STRING} printf("STR ");
{FLOAT} printf("FLOAT ");
{CHAR} printf("CHAR ");
{ASSIGN} printf("ASSIGN ");
{BOOL_DEF} printf("BOOL ");
{CHAR_DEF} printf("CHAR "); 
{STRING_DEF} printf("STRING "); 
{FLOAT_DEF} printf("FLOAT ");
{INTEGER_DEF} printf("INTEGER ");
{IDENTIFIER} printf("IDENTIFIER ");
{INCREASE} printf("INCREASE ");
{DECREASE} printf("DECREASE ");
{ARRAY_INT} printf("INT_ARRAY ");
{ARRAY_FLOAT} printf("FLOAT_ARRAY ");
{ARRAY_BOOL} printf("BOOL_ARRAY ");
{ARRAY_CHAR} printf("CHAR_ARRAY ");
{ARRAY_STRING} printf("STRING_ARRAY ");
{NL} /* */
{WS}  /* skip whitespace */


%%
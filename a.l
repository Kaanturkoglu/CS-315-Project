%option main
KASIK kasik 
BICAK bicak
PLUS \+
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
COMMENT \/\/([^\n]*)(\n)
MULTILINE_COMMENT "/*"([^*]|\*+[^*/])*\*+"/"
NL \n
WS [ \t\r\f\v]+
OROP \|\|
ANDOP \&\&
EQUAL \=\=
ASSIGN \=
NOT \!
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
DOT \.
GREATER_THAN \>
LESS_THAN \<
GRE_OR_EQU \>\=
LES_OR_EQU \<\=
NOT_EQUAL \!\=
TRUE true
FALSE false
YE ye
TUKUR tukur
BOOL_DEF bool 
CHAR_DEF char 
STRING_DEF string 
FLOAT_DEF float 
INTEGER_DEF int
DON don
TT \'

%%
{KASIK} printf(" KASIK");
{BICAK} printf(" BICAK");
{ARRAY_IDENT} printf(" ARRAY_IDENT");
{TT} printf(" TT");
{INT} printf(" INT");
{DON} printf(" DON");
{OROP} printf(" OROP");
{ANDOP} printf(" ANDOP");
{EQUAL} printf(" EQUAL");
{NOT} printf(" NOT");
{PLUS} printf(" PLUS");
{MINUS} printf(" MINUS");
{DIV} printf(" DIV");
{MULT} printf(" MULT");
{EXPONENT} printf(" EXPONENT");
{COMMENT} printf(" COMMENT");
{MULTILINE_COMMENT} printf(" MULTILINE_COMMENT");
{MOD} printf(" MOD");
{IF} printf(" IF");
{ELSE} printf(" ELSE");
{FOR} printf(" FOR");
{WHILE} printf(" WHILE");
{FUNCT} printf(" FUNCT");
{LP} printf(" LP");
{RP} printf(" RP");
{LB} printf(" LB");
{RB} printf(" RB");
{LSB} printf(" LSB");
{RSB} printf(" RSB");
{SC} printf(" SC");
{COMMA} printf(" COMMA");
{DOT} printf(" DOT");
{YE} printf(" YE");
{TUKUR} printf(" TUKUR");
{GREATER_THAN} printf(" GREATER_THAN");
{LESS_THAN} printf(" LESS_THAN");
{GRE_OR_EQU} printf(" GRE_OR_EQU");
{LES_OR_EQU} printf(" LES_OR_EQU");
{NOT_EQUAL} printf(" NOT_EQUAL");
{TRUE} printf(" TRUE");
{FALSE} printf(" FALSE");
{STRING} printf(" STRING");
{FLOAT} printf(" FLOAT");
{CHAR} printf(" CHAR");
{ASSIGN} printf(" ASSIGN");
{BOOL_DEF} printf(" BOOL_DEF");
{CHAR_DEF} printf(" CHAR_DEF");
{STRING_DEF} printf(" STRING_DEF");
{FLOAT_DEF} printf(" FLOAT_DEF");
{INTEGER_DEF} printf(" INTEGER_DEF");
{IDENTIFIER} printf(" IDENTIFIER");
{INCREASE} printf(" INCREASE");
{DECREASE} printf(" DECREASE");
{NL} ;
{WS} ;
%%
%option yylineno
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
{KASIK} return KASIK;
{BICAK} return BICAK;
{ARRAY_IDENT} return ARRAY_IDENT;
{TT} return TT;
{INT} return INT;
{DON} return DON;
{OROP} return OROP;
{ANDOP} return ANDOP;
{EQUAL} return EQUAL;
{NOT} return NOT;
{PLUS} return PLUS;
{MINUS} return MINUS;
{DIV} return DIV;
{MULT} return MULT;
{EXPONENT} return EXPONENT;
{COMMENT} return COMMENT;
{MULTILINE_COMMENT} return MULTILINE_COMMENT;
{MOD} return MOD;
{IF} return IF;
{ELSE} return ELSE;
{FOR} return FOR;
{WHILE} return WHILE;
{FUNCT} return FUNCT;
{LP} return LP;
{RP} return RP;
{LB} return LB;
{RB} return RB;
{LSB} return LSB;
{RSB} return RSB;
{SC} return SC;
{COMMA} return COMMA;
{DOT} return DOT;
{YE} return YE;
{TUKUR} return TUKUR;
{GREATER_THAN} return GREATER_THAN;
{LESS_THAN} return LESS_THAN;
{GRE_OR_EQU} return GRE_OR_EQU;
{LES_OR_EQU} return LES_OR_EQU;
{NOT_EQUAL} return NOT_EQUAL;
{TRUE} return TRUE;
{FALSE} return FALSE;
{STRING} return STRING;
{FLOAT} return FLOAT;
{CHAR} return CHAR;
{ASSIGN} return ASSIGN;
{BOOL_DEF} return BOOL_DEF;
{CHAR_DEF} return CHAR_DEF;
{STRING_DEF} return STRING_DEF;
{FLOAT_DEF} return FLOAT_DEF;
{INTEGER_DEF} return INTEGER_DEF;
{IDENTIFIER} return IDENTIFIER;
{INCREASE} return INCREASE;
{DECREASE} return DECREASE;
{NL} ; 
{WS} ;

%%
int yywrap(){return 1;}
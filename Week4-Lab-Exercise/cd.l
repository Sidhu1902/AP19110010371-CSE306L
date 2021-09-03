/*Definition Section*/
%{
#include<stdio.h>
%}
%%
auto|double|int|struct|break|else|long|switch|case|enum|register|typedef|char|extern|return|union|continue|for|signed|void|do|if|static|while|default|goto|sizeof|volatile|const|float|s
hort {ECHO; printf("\tKEYWORD\n");} //rule for keyboard
[{};,()] {ECHO; printf("\tSEPERATOR\n");} //rule for seperator
[+-/=*%] {ECHO; printf("\tOPERATOR\n");} //rule for operator
[a-zA-Z_][a-zA-Z0-9_]* {ECHO; printf("\tIdentifier\n");} //rule for identifier
[0-9]+ {ECHO;printf("\t Digit\n", yytext);} //rule for digit
"<" | ">" | "<=" | ">=" | "==" | "!=" {ECHO; printf("\tRELATIONAL OPERATOR\n");} //rule for relational operator
[/][*][^*]*[*]+([^*/][^*]*[*]+)*[/] {} //rule for skipping multi line comments
. {ECHO;printf("\t Other\n");} //rule for skipping other characters (not above mentioned)
%%
/*call the yywrap function*/
int yywrap(){}
int main(void)
{
/*call the yylex function.*/
yyin=fopen("evenorodd.c","r");
yylex();
return 0;}
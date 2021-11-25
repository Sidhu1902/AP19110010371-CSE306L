/*Definition Section*/
%{
#include<stdio.h>
%}
%%
abstract|continue|for|new|switch|assert|default|goto|package|synchronized|boolean|do|if|private|this|break|double|implements|protected|throw|byte|else|import|public|throws|case|enum|instanceof|return|transient|catch|extends|int|short|try|char|final|interface|static|void|class|finally|long|strictfp|volatile|const|float|native|super|while {ECHO; printf("\tKEYWORD\n");} //rule for keyboard
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
yyin=fopen("evenorodd.java","r");
yylex();
return 0;}
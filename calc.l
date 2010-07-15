/* 
 *  Example from the book: 
 *  Flex & Bison
 *  Author: John Levine
 *  Publisher: O'Reilly Media
 *  ISBN-13: 978-0596155971
 */
%{
#include "calc.tab.h"
%}

%%
"("    {return OP;}
")"    {return CP;}
"//".* /* ignore comments */
"+"    {return ADD;}
"-"    {return SUB;}
"*"    {return MUL;}
"/"    {return DIV;}
"|"    {return ABS;}
[0-9]+ {yylval = atoi(yytext); return NUMBER;}
\n     {return EOL;}
[ \t]  { /* ignore whitespaces */ }
.      {printf("Mistery character %s\n", yytext);}
%%

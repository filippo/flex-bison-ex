%{
#include <string.h>

  enum yytokentype {
    ATTR_REF = 258
  };
  char yylval[1024];
%}
%%
"$"[a-zA-Z_\'\"][0-9a-zA-Z_\'\"\.]+"$" {
  memset(yylval, '\0', 1024); 
  strncpy(yylval, yytext+1, strlen(yytext)-2); 
  return ATTR_REF;
}
.                                      {printf("%s", yytext);}
%%

int main(int argc, char **argv) {
  int tok;

  while (tok = yylex()) {
    printf("\ntokid: %d\n", tok);
    if (tok == ATTR_REF) {
      printf("token found: %s\n", yylval);
    }
  }
}

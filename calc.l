%{
  void yyerror(char *);
  #include "y.tab.h"
%}

%%

[0-9]+ {
    yylval = atoi(yytext);
    return INT;
  }

[-+\n] return *yytext;

[ \t] ;

. ; //yyerror("invalid char");

%%

int yywrap(void) {
  return 1;  
}


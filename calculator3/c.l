%{
    #include <stdlib.h>
    #include "y.tab.h"
    void yyerror(char *);
%}

%%

12
12.4

[0-9](\.[0-9]+)* {
    yylval.v = atof(yytext);
    return INTIEGER;
}

[a-zA-Z_][a-zA-Z0-9_]* {
    yylval.v = 9;
    return VARIABLE;
}

[ \t] ; 

[-+/*@\n] return yytext[0];

. yyerror("Invalid char");

%%
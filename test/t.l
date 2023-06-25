%{
	#include <stdlib.h>
	void yyerror(char *);
	#include "y.tab.h"
%}

%%

<<EOF>> { yyterminate(); return 0; }

[0-9]+ {
	yylval = atoi(yytext);
	return INTEGER;
}

[-+\n] return *yytext;

[ \t] ; /* skip whitespace */

. yyerror("invalid character");

%%

int yywrap(void) {
	return 1;
}
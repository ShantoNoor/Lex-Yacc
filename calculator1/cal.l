%{

#include<stdio.h>

#include "y.tab.h"

extern int yylval;

%}

%%

<<EOF>> {
	printf("eof \n");
	return EXIT;
}

"exit\n" {
	return EXIT;
}

[0-9]+ {
	yylval=atoi(yytext);
	return NUMBER;
}

[ \t] ;

\n  return 0;

. return yytext[0];

%%

int yywrap() {
	return 1;
}
%{
#include <stdio.h>
int nchar = 0, nword = 0, nline = 0;
%}

%%

\n { ++nline; ++nchar; }

<<EOF>> { ++nline; return 0; }

\b\w+\b { ++nword, nchar += yyleng; printf("\n%s\n", yytext); }

. { ++nchar; }

%%

int main() {
	yylex();
	printf("%d\t%d\t%d\n", nchar, nword, nline);
	return 0;
}
%{
    int nchar;
    int nline;
    int nword;    
%}

%%

\n { nchar++; nline++; }

<<EOF>> { nline++; return 0; }

[^\s\t\n]+ { nword++; nchar += yyleng; }

. { nchar++; };

%%

int main() {
    yylex();
    printf("%d %d %d\n", nchar, nword, nline);
    return 0;
}
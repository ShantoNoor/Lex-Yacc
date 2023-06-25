%token INTIEGER VARIABLE;

%{
    #include <stdio.h>
    #include <math.h>
    void yyerror(char *);
%}

%union {
    double v;
}

%%

prog: prog state '\n'
    |
    ;
state: expr { printf("%lf\n", $<v>1); }
    ;
expr: expr '+' B { $<v>$ = $<v>1 + $<v>3; }
    | B { $<v>$ = $<v>1; }
    ;
B: B '-' C { $<v>$ = $<v>1 - $<v>3; }
    | C { $<v>$ = $<v>1; }
    ;
C: C '*' D { $<v>$ = $<v>1 * $<v>3; }
    | D { $<v>$ = $<v>1; }
    ;
D: Z '@' D { $<v>$ = pow($<v>1, $<v>3); }
    | Z { $<v>$ = $<v>1; }
    ;
Z: INTIEGER { $<v>$ = $<v>1; printf("%lf\n", $<v>1);}
    ;

%%

void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
    return;
}

int main() {
    yyparse();
    return 0;
}
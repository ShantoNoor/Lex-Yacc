%token INT 

%{
  #include <stdio.h>
  void yyerror(char *);
  int yylex(void);
%}

%%

prog: A'\n' {printf("%d\n", $1);}
    |
    ;
A: A '+' B {$$ = $1 + $3;}
 | B {$$ = $1;}
 ;

B: B '-' C {$$ = $1 - $3;}
 | C {$$ = $1;}
 ;

C: INT {$$ = $1;}
 |
 ;

%%

void yyerror(char *s) {
  fprintf(stderr, "%s\n", s);
}

int main(void) {
  yyparse();
  return 0;
}

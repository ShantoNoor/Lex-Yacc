%{

#include<stdio.h>
int flag=0;

%}

%token NUMBER EXIT

%left '+' '-'

%left '*' '/' '%'

%left '(' ')'

%%

ArithmeticExpression: E { printf("\nResult=%d\n",$$); }
    | EXIT { return 1; }
    ;

E:E'+'E {$$=$1+$3;}

    |E'-'E {$$=$1-$3;}

    |E'*'E {$$=$1*$3;}

    |E'/'E {$$=$1/$3;}

    |E'%'E {$$=$1%$3;}

    |'('E')' {$$=$2;}

    | NUMBER {$$=$1;}
    ;

%%



int main() {
    printf("\nEnter Any Arithmetic Expression which can have operations Addition, Subtraction, Multiplication, Divison, Modulus and Round brackets:\n");

    while(!yyparse()) {
        if(flag==0)
            printf("\nEntered arithmetic expression is Valid main\n\n");
    }

    return 0;
}

void yyerror() {
    printf("\nEntered arithmetic expression is Invalid error\n\n");
    flag=1;
}
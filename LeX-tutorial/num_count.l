%{
	int count =0, max = 0 ;
%} 
%%
[0-9] {printf("%s digit found\n",yytext);}
[0-9]+ {
	++count;
	int num = 0;
	for (int i=0; i< yyleng;i++){
		num = num*10 + (yytext[i]-'0');
	}
	if (num > max) {
		max = num;	
	}
}
. ;
[ \n\t] ;
%%

int main() {
	yylex();
	printf("total %d numbers found\n",count);
	printf("max number = %d\n",max);	
	return 0;
}

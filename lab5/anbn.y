%{
	#include<stdio.h>
	#include<stdlib.h>	
%}
%token A B NL
%start S
%%
S:S1 NL {printf("Valid String\n");exit(0);}
	;
S1:A S1 B
 |
 ;
%%
yyerror(char* msg){
	printf("%s: invalid string\n",msg);exit(0);
}
main(){
	printf("Enter the string\n");
	yyparse();
}
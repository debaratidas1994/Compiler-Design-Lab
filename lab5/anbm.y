%{
	#include<stdio.h>
	#include<stdlib.h>	
%}
%token A B NL
%start S
%%
S: S1 NL {printf("valid string\n");exit(0);}
 ;
S1: term1 term2
 ;
term1: A term1
	| A
 	;
term2: B term2
	|
	;
%%
yyerror(char* msg){
	printf("%s: invalid string\n",msg);exit(0);
}
main(){
	printf("enter string: ");
	yyparse();	
}
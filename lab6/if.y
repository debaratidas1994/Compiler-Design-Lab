%{
	#include<stdio.h>
	#include<stdlib.h>
	extern FILE* yyin;
	int count = 0;	
%}
%token IF OB CB STMT ID NUMBER RELOP OP CP
%%
S1: IFstmt {printf("%d\n",count);exit(0);}
	; 
IFstmt: IF OP C CP OB S CB {count++;}
	;
C: operand RELOP operand
	;
operand: ID
	| NUMBER
	;
S: STMT S
	| IFstmt S
	|
	;
%%
yyerror(char* msg){
	printf("error: %s\n",msg);exit(0);
}
main(){
	yyin = fopen("in.txt","r");
	yyparse();
	exit(0);
}

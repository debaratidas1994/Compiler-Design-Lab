%{
	/*
		Lex program to identify and count identifiers and keywords.
		test cases:
			ip: else and if are valid keywords
			op: else - kw
				and - id
				if - kw
				are - id
				valid - id
				keywords - id

				kw count: 2
				id count: 4

			ip: int and float are data types
			op: int - kw
				and - id
				float - kw
				are - id
				data - id
				types - id

				kw count: 2
				id count: 4
	*/
	int idc = 0, kwc = 0;
%}
letter [a-zA-Z]+
digit [0-9]+
keywords if|else|while|for|int|float
identifier {letter}[{letter}|{digit}]*
%%
{keywords} {
	kwc+=1;
	printf("%s - kw\n",yytext);
}
{identifier} {
	idc+=1;
	printf("%s - id\n",yytext);
}
[ \n]+
%%
int main(){
	yylex();
	printf("\nkw count: %d\nid count: %d\n",kwc,idc);
	return 0;
}

%{
	/*
		Lex program to count words, lines, characters, spaces in input stream.
		test cases:
			ip: In teaching others we teach ourselves
			op: wc: 6 
				cc: 38
				lc: 1
				sc: 5
			
			ip: I hear and I forget
				I see and I remember
				I do and I understand
			op: wc: 15 
				cc: 63
				lc: 3
				sc: 12
	*/
	int wc = 0, cc = 0, lc = 0, sc = 0;
%}
letter [a-zA-Z]+
digit [0-9]+
identifier {letter}[{letter}|{digit}]*
%%
{identifier}[ ] {
	sc+=1;
	wc+=1;
	cc+=yyleng;
}
{identifier}[\n] {
	wc+=1;
	lc+=1;
	cc+=yyleng;
}
{identifier} {
	wc+=1;
	cc+=yyleng;
}
%%
int main()
{
	yylex();
	printf("wc: %d \ncc: %d\nlc: %d\nsc: %d\n",wc,cc,lc,sc);
}

%{
	/*
		Lex program to count vowels and consonants in input stream.

		test cases:
			ip: hello world
			op: vc: 3
			    cc: 7
			
			ip:     I hear and I forget
				I see and I remember
				I do and I understand
			op: vc: 22
				cc: 26
	*/
	int vc=0,cc=0;
%}
%%
[^a-z] {
}
[aeiouAEIOU] {
	vc+=1;
}
[b-df-hj-np-tv-zB-DF-HJ-NP-TV-Z] {
	cc+=1;
}
%%
int main(void){
	yylex();
	printf("vc: %d\n",vc);
	printf("cc: %d\n",cc);
}

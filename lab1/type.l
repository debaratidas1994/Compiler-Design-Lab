%{
	/*
		Lex program to identify word number or semicolon in input stream.
		test cases:
			ip: 123 is a number;
			op: number word word word semicolon
			
			ip: I hear and I forget
				I see and I remember
				I do and I understand
			op: wc: 15 
				cc: 63
				lc: 3
				sc: 12
	*/
%}

%%
[a-zA-Z]+ printf("word ");
[0-9]+ printf("number");
; printf("semicolon");

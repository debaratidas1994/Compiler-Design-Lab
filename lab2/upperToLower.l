%{
	/*
		Lex program to convert uppercase to lowercase.
		test cases:
			ip: Everything is HARD 
				before it is EASY
			op: everything is hard 
				before it is easy

			ip: ThIs MUsT bE FUnNy
			op: this must be funny
	*/
%}
%%
[A-Z] {
	printf("%c",'a'+(yytext[0]-'A'));	
}
[^A-Za-z \n.,\'] {}
%%
int main(){
	yylex();
	return 0;
}

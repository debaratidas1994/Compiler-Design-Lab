%{
	int idc=0,kwc=0;
%}
letter [a-zA-Z]+
digit [0-9]+
keywords auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while
identifier {letter}({letter}|{digit})*
%%
[ {}#] {} 
[^{letter}{digit}] {}
{keywords} {
	kwc+=1;
	fprintf(yyout,"%s - kw\n",yytext);
}
{identifier} {
	idc+=1;
	fprintf(yyout,"%s - id\n",yytext);
}
%%
int main(int argc, char *argv[]){
	if(argc == 1){
		printf("Error: Please specify input and output file in command line\n");
	}else if(argc == 2){
		printf("Error: Please specify output file in command line\n");	
	}else if(argc == 3){
		printf("i/p file  <- %s\n",argv[1]);
		printf("o/p file -> %s\n",argv[2]);
		yyin = fopen(argv[1],"r");
		yyout = fopen(argv[2],"w");
		yylex();
		fprintf(yyout,"\nkw count: %d\nid count: %d\n",kwc,idc);
		fclose(yyin);
		fclose(yyout);
		printf("done\n");
	}else{
		printf("Error: Invalid argument length\nPlease specify input and output file in command line\n");	
	}
	return 0;
}

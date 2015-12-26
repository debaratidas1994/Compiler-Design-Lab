%{
	#include "y.tab.h"
%}
%%
"if" {return IF;}
[a-zA-Z ]; {return STMT;}
"{" {return OB;}
"}" {return CB;}
"(" {return OP;}
")" {return CP;}
"<"|">"|"<="|">="|"=="|"!=" {return RELOP;}
[a-zA-Z][a-zA-Z0-9]* {return ID;}
[0-9]+ {return NUMBER;}

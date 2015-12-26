
%{
    #include <stdlib.h>
    #include <stdio.h>
    #include <math.h>
    int v = 0, o = 0, d = 0; //valid bit, octal number, decimal number
%}

%%
^[0-7]+  {v = 1; o = atoi(yytext);}
[\n] {;}
. {v = 0;}
%%

int yywrap()
{
    if (v)
    {
        d = todec(o);
        printf("Decimal is %d\n", d);
    }
    else
    {
        printf("Invalid");
    }
}

int pow1(int base,int r)
{
int p=1;int i=0;
for(i=0;i<r;i++)
{
p*=base;
}
return p;
}

int todec(int oct)
{
    int dec = 0, pos = 0;
    while(oct)
    {
        int a = oct % 10;
        dec += a * pow1(8, pos);
        pos++;
        oct /= 10;
    }
    return dec;
}

int main()
{
    printf("Enter the octal number: ");
    yylex();
    return 0;
}

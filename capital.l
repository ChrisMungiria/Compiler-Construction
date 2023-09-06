/*** Definition Section has one variable
which can be accessed inside yylex()
and main() ***/
%{
#include <stdio.h>
int count = 0;
%}

/*** Rule Section has rules to tokenize words and handle whitespace ***/
%%
[a-zA-Z]+ {
    printf("%s\n", yytext);
}
[ \t\n]+ {
    // Ignore whitespace
}
. {
    // Ignore any other characters
}
%%

/*** Code Section ***/
int yywrap() {
    return 1; // Indicate that there are no more input streams
}

int main() {
    // Uncomment the lines below to take input from a file
    // FILE *fp;
    // char filename[50];
    // printf("Enter the filename: \n");
    // scanf("%s", filename);
    // fp = fopen(filename, "r");
    // yyin = fp;

    //The following code uses a static sentence
    //yy_scan_string("He is a smart student.");
    yylex();
    return 0;
}

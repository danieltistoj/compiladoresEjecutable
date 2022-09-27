/*
Proyecto corto reconocimiento lenguaje javascriop 
Por luis Gudiel Y Melanie Godinez 
*/
%{
    #include<stdlib.h>
    #include<string.h>
    int cantidadLexemas=0;
    int cantidadLineas = 1;
    int cantidadCaracteres=0;

    void countCaracter(char cadena[])
    {
        int longitud = 0;
        longitud =strlen(cadena);
        cantidadCaracteres = longitud + cantidadCaracteres;
    }
%}
%%

[0-9]+                                      {cantidadLexemas++,countCaracter(yytext),printf("Lexema tipo entero: %s encontrado en la linea %i \n",yytext,cantidadLineas);} 
[0-9]+\.[0-9]+                              {cantidadLexemas++,countCaracter(yytext),printf("Lexema tipo flotante: %s encontrado en la linea %i \n",yytext,cantidadLineas);}
(true|false)                                {cantidadLexemas++,countCaracter(yytext),printf("Lexema tipo booleano: %s encontrado en la linea %i \n",yytext,cantidadLineas);}
([\+|-|==|=|\>|\<|\^|%|\*|\/|\{|\}|\(|\)|\;])  {cantidadLexemas++,countCaracter(yytext),printf("Lexema tipo Operador: %s encontrado en la linea %i \n",yytext,cantidadLineas);}
('(\\.|[^'])*'|\"(\\.|[^"])*\")             {cantidadLexemas++,countCaracter(yytext),printf("Lexema tipo Cadena: %s encontrado en la linea %i \n",yytext,cantidadLineas);}
(int|string|float|bool|console|function|return|private|public|enum|void|new|this|switch|for|if|try|catch|class|const|delete|for|if|else|case|var|prompt)     {cantidadLexemas++,countCaracter(yytext),printf("Lexema tipo Palabra reservada: %s encontrado en la linea %i \n",yytext,cantidadLineas);}
([a-zA-z]+\w*)                              {cantidadLexemas++,countCaracter(yytext),printf("Lexema tipo Identificador: %s encontrado en la linea %i \n",yytext,cantidadLineas);}
.                                           {cantidadCaracteres++;}
\n                                          {cantidadLineas++;}



%%
int main(){
    yylex();

    printf("Total de lexemas encontrados: %i\n",cantidadLexemas);
    printf("Total lineas encontradas: %i\n",cantidadLineas-1);
    printf("Total de caracteres encontrados: %i\n",cantidadCaracteres);

}
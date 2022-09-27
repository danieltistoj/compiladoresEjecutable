

%{
    //Luis Pedro Gudiel Lopez
    //carnet 201908001 
    #include<stdlib.h>
    #include<string.h>
    int fecha=0,direccion=0,enlace=0;
    int linea = 1;
    int sum=0;
    char* numero;

%}
%%
([0-9]{2}\/[0-9]{2}\/[0-9]{2}) {fecha++,printf("Lexema tipo fecha: %s encontrado en la linea %i \n",yytext,linea);}
([0-9]{2}\:[0-9]{2}\:[0-9]{2}\:[0-9]{2}) {direccion++,printf("Lexema tipo direccion: %s encontrado en la linea %i \n",yytext,linea);}
(magnet\:\?xt\=urn\:ed[0-9]kv[0-9]\:([A-Z]|[0-9]){32}) {enlace++,printf("Lexema tipo enlace: %s encontrado en la linea %i \n",yytext,linea);}
\n {linea++;}
. {}
%%
int main(){
    yylex();

    printf("Total de fechas encontradas: %i\n",fecha);
    printf("Total direcciones encontradas: %i\n",direccion);
    printf("Total de enlaces encontrados: %i\n",enlace);
}

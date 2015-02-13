
package compiladorcisco;

import java_cup.runtime.*;
import java.io.Reader;
      
%%

%class AnalizadorLexico
%line
%column
%cup

%{
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}
WHITE=[ ]

%% 
   
<YYINITIAL> {
    "show"                { return symbol(sym.MOSTRAR); }
    "ip"                  { return symbol(sym.PROTOCOLO); }
    "interface"           { return symbol(sym.INTERFAZ); }
    "brief"               { return symbol(sym.LINEA); }
    "serial"              { return symbol(sym.PUERTO); }
    "controllers"         { return symbol(sym.CONTROLADOR); }
    {WHITE}               { return symbol(sym.ESPACIO); }
}
. { return symbol(sym.error); }
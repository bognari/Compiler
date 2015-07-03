package minijava; // The generated parser will belong to this package 

import minijava.MJParser.Terminals; 
// The terminals are implicitly defined in the parser
%%

// define the signature for the generated scanner
%public
%final
%class MJScanner 
%extends beaver.Scanner

// the interface between the scanner and the parser is the nextToken() method
%type beaver.Symbol 
%function nextToken 
%yylexthrow beaver.Scanner.Exception
%eofval{
	return new beaver.Symbol(Terminals.EOF, "end-of-file");
%eofval}

// store line and column information in the tokens
%line
%column

// this code will be inlined in the body of the generated scanner class
%{
  private beaver.Symbol sym(short id) {
    return new beaver.Symbol(id, yyline + 1, yycolumn + 1, yylength(), yytext());
  }
%}

LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
LINECOM        = "//"{InputCharacter}*{LineTerminator}
WhiteSpace     = {LineTerminator} | [ \t\f]
BLOCKCOM       = "/*"{InputCharacter}|{WhiteSpace}"*/"

CLASS = "class"
GKL = "{"
GKR = "}"
RKL = "("
RKR = ")"
EKL = "["
EKR = "]"
SVM = "static"{WhiteSpace}+"void"{WhiteSpace}+"main"{WhiteSpace}*"("{WhiteSpace}*"String"{WhiteSpace}*"["{WhiteSpace}*"]"
EXTENDS = "extends"
PUBLIC = "public"
RETURN = "return"
SEMI = ";"
K = ","
BOOLEAN = "boolean"
INTEGER = "int"
IF = "if"
ELSE = "else"
WHILE = "while"
SOUT = "System"{WhiteSpace}*"."{WhiteSpace}*"out"{WhiteSpace}*"."{WhiteSpace}*"println"
EQ = "="
DOT = "."
TRUE = "true"
FALSE = "false"
THIS = "this"
NEW = "new"
EXCLI = "!"
AND = "&&"
PLUS = "+"
MINUS = "-"
MUL = "*"
KLEINER = "<"
LENGTH = "length"
INT = ("+"|"-")?0|[1-9][0-9]*
ID = [:jletter:]([:jletterdigit:]|_)*

%%
{BLOCKCOM} { }
{LINECOM} { }

{SVM} {  return sym(Terminals.SVM); }
{SOUT} {  return sym(Terminals.SOUT); }

{WhiteSpace} { }

{CLASS} {  return sym(Terminals.CLASS); }
{GKL} {  return sym(Terminals.GKL); }
{GKR} {  return sym(Terminals.GKR); }
{RKL} {  return sym(Terminals.RKL); }
{RKR} {  return sym(Terminals.RKR); }
{EKL} {  return sym(Terminals.EKL); }
{EKR} {  return sym(Terminals.EKR); }
{EXTENDS} {  return sym(Terminals.EXTENDS); }
{PUBLIC} {  return sym(Terminals.PUBLIC); }
{RETURN} {  return sym(Terminals.RETURN); }
{SEMI} {  return sym(Terminals.SEMI); }
{K} {  return sym(Terminals.K); }
{BOOLEAN} {  return sym(Terminals.BOOLEAN); }
{IF} {  return sym(Terminals.IF); }
{ELSE} {  return sym(Terminals.ELSE); }
{WHILE} {  return sym(Terminals.WHILE); }
{EQ} {  return sym(Terminals.EQ); }
{DOT} {  return sym(Terminals.DOT); }
{TRUE} {  return sym(Terminals.TRUE); }
{FALSE} {  return sym(Terminals.FALSE); }
{INTEGER} {  return sym(Terminals.INTEGER); }
{THIS} {  return sym(Terminals.THIS); }
{NEW} {  return sym(Terminals.NEW); }
{EXCLI} {  return sym(Terminals.EXCLI); }
{AND} {  return sym(Terminals.AND); }
{PLUS} {  return sym(Terminals.PLUS); }
{MINUS} {  return sym(Terminals.MINUS); }
{MUL} {  return sym(Terminals.MUL); }
{KLEINER} {  return sym(Terminals.KLEINER); }
{LENGTH} {  return sym(Terminals.LENGTH); }
{INT} {  return sym(Terminals.INT); }
{ID} {  return sym(Terminals.ID); }





// fall through errors
.            { throw new beaver.Scanner.Exception("illegal character \"" + yytext() + "\" at line " + yyline + "," + yycolumn); }

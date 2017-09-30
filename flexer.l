 // Skeleton Flex file for the project - Part 1
%option c++
%option noyywrap
%option yylineno
%{
#include "token.h"
%}
ws [ \t\r\n]
letter_ [a-zA-Z]|_
digit [0-9]
id {letter_}({letter_}|{digit})*
digits ({digit})+
optional_fraction (.{digits})?
optional_exponent (E[+|-]?{digits})?
num {digits}{optional_fraction}{optional_exponent}
commento [(\/\*)((?!\*\/).*)*(\*\/)]
commenta \/\*.*\*\/
/* regex for multiline comments was heavily influeced by:https://blog.ostermiller.org/find-comment */
/* we start by matching /* followed by any letter any amount of time, or a newline*/
/* or another comment block within then finish off with a "* /" */
comment \/\*([^*]|\r\n|(\*+([^*/]|\r\n)))*\*\/
%%
{ws}+               /* do nothing */
{comment}+           /* do nothing */
                    /* Keywords */
"class"             { return Tokentype::kwClass; }
"static"            { return Tokentype::kwStatic; }
"void"              { return Tokentype::kwVoid; }
"if"                { return Tokentype::kwIf; }
"else"              { return Tokentype::kwElse; }
"for"               { return Tokentype::kwFor; }
"return"            { return Tokentype::kwReturn; }
"break"             { return Tokentype::kwBreak; }
"continue"          { return Tokentype::kwContinue; }
"int"               { return Tokentype::kwInt; }
"real"              { return Tokentype::kwReal; }

                    /* Punctuation marks */
"["                 { return Tokentype::ptLBracket; }
"]"                 { return Tokentype::ptRBracket; }
"("                 { return Tokentype::ptLParen; }
")"                 { return Tokentype::ptRParen; }
";"                 { return Tokentype::ptSemicolon; }
","                 { return Tokentype::ptComma;}
"{"                 { return Tokentype::ptLBrace; }
"}"                 { return Tokentype::ptRBrace; }
                    /* Relational */
"=="                { return Tokentype::OpRelEQ; }
"!="                { return Tokentype::OpRelNEQ; }
"<"                 { return Tokentype::OpRelLT; }
"<="                { return Tokentype::OpRelLTE; }
">"                 { return Tokentype::OpRelGT; }
">="                { return Tokentype::OpRelGTE; }
                    /* Arithmetic */
"++"                { return Tokentype::OpArtInc; }
"--"                { return Tokentype::OpArtDec; }
"+"                 { return Tokentype::OpArtPlus; }
"-"                 { return Tokentype::OpArtMinus; }
"*"                 { return Tokentype::OpArtMult; }
"/"                 { return Tokentype::OpArtDiv; }
"%"                 { return Tokentype::OpArtModulus; }
                    /* Logical */
"&&"                { return Tokentype::OpLogAnd; }
"||"                { return Tokentype::OpLogOr; }
"!"                 { return Tokentype::OpLogNot; }
                    /* Assign*/
"="                 { return Tokentype::OpAssign; }

{id}                { return Tokentype::Identifier; }
{num}               { return Tokentype::Number; }
%%
 // No need to add any code here.

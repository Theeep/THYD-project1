//
// Compiler project -- main driver for part 1
//
#include "hlexer.h"

using namespace std;

HLexer::HLexer(std::istream &is, SymbolTable &symbol_table)
    : Lexer(is, symbol_table), line_no_(1)
{
    is_.get(c_);
    curr_.clear();
}

void HLexer::get_next(Token &token)
{
    token.lexeme.clear();
    token.entry = nullptr;
    bool hasBeenAddedToST = false;

    while (is_.good() && isspace(c_))
    {
        if (c_ == '\n')
        {
            ++line_no_;
        }
        is_.get(c_);
    }

    token.line = line_no_;

    if (!is_.good())
    {
        token.type = Tokentype::EOI;
        return;
    }

    if (isalpha(c_))
    {
        
        do
        {
            curr_.push_back(c_);
            char next = is_.peek();
            if (!(isalnum(next)) && !(next == '_'))
            {
                break;
            }
            is_.get(c_);
        } while (isalnum(c_) || c_ == '_');

        if (curr_ == "class")
        {
            token.type = Tokentype::kwClass;
        }
        else if (curr_ == "static")
        {
            token.type = Tokentype::kwStatic;
        }
        else if (curr_ == "void")
        {
            token.type = Tokentype::kwVoid;
        }
        else if (curr_ == "if")
        {
            token.type = Tokentype::kwIf;
        }
        else if (curr_ == "else")
        {
            token.type = Tokentype::kwElse;
        }
        else if (curr_ == "for")
        {
            token.type = Tokentype::kwFor;
        }
        else if (curr_ == "return")
        {
            token.type = Tokentype::kwReturn;
        }
        else if (curr_ == "break")
        {
            token.type = Tokentype::kwBreak;
        }
        else if (curr_ == "continue")
        {
            token.type = Tokentype::kwContinue;
        }
        else if (curr_ == "int")
        {
            token.type = Tokentype::kwInt;
        }
        else if (curr_ == "real")
        {
            token.type = Tokentype::kwReal;
        }
        else
        {
            token.type = Tokentype::Identifier;
            addCurrToST(token);
        }
    }
    else if (isdigit(c_))
    {
        token.type = Tokentype::Number;

        do
        {
            curr_.push_back(c_);
            char next = is_.peek();
            if (!isdigit(next) && next != '.' && next != 'E')
            {
                if (!hasBeenAddedToST)
                {
                    hasBeenAddedToST = true;
                    addCurrToST(token);
                }
               
                break;
            }
            is_.get(c_);
        } while (isdigit(c_));
        
        if( c_ == '.')
        {
            do
            {
                curr_.push_back(c_);
                char next = is_.peek();
                if (!isdigit(next) && next != 'E')
                {

                    if (!hasBeenAddedToST)
                    {
                        hasBeenAddedToST = true;
                        addCurrToST(token);
                    }
                    break;
                }
                is_.get(c_);
            } while (isdigit(c_));
                
        }
        if( c_ == 'E')
        {
            do
            {
                curr_.push_back(c_);
                char next = is_.peek();
                if (!isdigit(next))
                {

                    if (!hasBeenAddedToST)
                    {
                        hasBeenAddedToST = true;
                        addCurrToST(token);
                    }
                    break;
                }
                is_.get(c_);
            } while (isdigit(c_));
        }
        if( isalpha(c_))
        {
            token.type = Tokentype::ErrUnknown;
            curr_.push_back(c_);
        }

      
    }
    else if (ispunct(c_))
    {
        char next;

        switch (c_)
        {
        case '[':
            token.type = Tokentype::ptLBracket;
            curr_ += c_;
            break;
        case ']':
            token.type = Tokentype::ptRBracket;
            curr_ += c_;
            break;
        case '(':
            token.type = Tokentype::ptLParen;
            curr_ += c_;
            break;
        case ')':
            token.type = Tokentype::ptRParen;
            curr_ += c_;
            break;
        case ',':
            token.type = Tokentype::ptComma;
            curr_ += c_;
            break;
        case ';':
            token.type = Tokentype::ptSemicolon;
            curr_ += c_;
            break;
        case '{':
            token.type = Tokentype::ptLBrace;
            curr_ += c_;
            break;
        case '}':
            token.type = Tokentype::ptRBrace;
            curr_ += c_;
            break;
        case '=':
            next = is_.peek();
            token.type = (next == '=') ? Tokentype::OpRelEQ : Tokentype::OpAssign;
            if (next == '=')
            {
                curr_ = "==";
                is_.get(c_);
            }
            else 
            {
                curr_ = "=";
            }
            break;
        case '!':
            next = is_.peek();
            token.type = (next == '=') ? Tokentype::OpRelNEQ : Tokentype::OpLogNot;
            if (next == '=')
            {
                curr_ = "!=";
                is_.get(c_);
            }
            else 
            {
                curr_ = "!";
            }
            break;
        case '<':
            next = is_.peek();
            token.type = (next == '=') ? Tokentype::OpRelLTE : Tokentype::OpRelLT;
            if (next == '=')
            {
                curr_ = "<=";
                is_.get(c_);
            }
            else 
            {
                curr_ = "<";
            }
            break;
        case '>':
            next = is_.peek();
            token.type = (next == '=') ? Tokentype::OpRelGTE : Tokentype::OpRelGT;
            if (next == '=')
            {
                curr_ = ">=";
                is_.get(c_);
            }
            else 
            {
                curr_ = ">";
            }
            break;
        case '+':
            next = is_.peek();
            token.type = (next == '+') ? Tokentype::OpArtInc : Tokentype::OpArtPlus;
            if (next == '+')
            {
                curr_ = "++";
                is_.get(c_);
            }
            else 
            {
                curr_ = "+";
            }
            break;
        case '-':
            next = is_.peek();
            token.type = (next == '-') ? Tokentype::OpArtDec : Tokentype::OpArtMinus;
            if (next == '-')
            {
                curr_ = "--";
                is_.get(c_);
            }
            else 
            {
                curr_ = "-";
            }
            break;
        case '*':
            token.type = Tokentype::OpArtMult;
            curr_ = "*";
            break;
        case '/':
            next = is_.peek();
            if (next == '*')
            {
                handleComment();
                is_.get(c_);
                curr_.clear();
                return;
            }
            token.type = Tokentype::OpArtDiv;
            curr_ = "/";
            break;
        case '%':
            token.type = Tokentype::OpArtModulus;
            curr_ = "%";
            break;
        case '&':
            next = is_.peek();
            token.type = (next == '&') ? Tokentype::OpLogAnd : Tokentype::ErrUnknown;
            if (next == '&')
            {
                curr_ = "&&";
            }
            else
            {
                curr_ = "&";
                curr_.push_back(c_);
            }
            is_.get(c_);
            break;
        case '|':
            next = is_.peek();
            token.type = (next == '|') ? Tokentype::OpLogOr : Tokentype::ErrUnknown;
            if (next == '|')
            {
                curr_ = "||";
            }
            else
            {
                curr_ = "|";
                curr_.push_back(c_);
            }
            is_.get(c_);
            break;
        default:
            token.type = Tokentype::ErrUnknown;
            curr_.push_back(c_);
            break;
        }
    }

    token.lexeme = curr_;
    is_.get(c_);
    curr_.clear();
}

std::string HLexer::get_name() const
{
    return "handmade";
}

HLexer::~HLexer()
{
}

void HLexer::handleComment()
{
    is_.get(c_);
    is_.get(c_);
    while(true)
    {
        char next = is_.peek();
        if (c_ == '*' && next == '/')
        {
            is_.get(c_);
            return;
        }
        is_.get(c_);
    }
}
void HLexer::addCurrToST(Token &token)
{
    SymbolTable::Entry *newEntry = new SymbolTable::Entry();
    newEntry->name = curr_;
    symbol_table_.add(*newEntry);
    token.entry = newEntry;
}
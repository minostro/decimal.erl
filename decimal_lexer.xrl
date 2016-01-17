Definitions.

Sign         = (\+|-)
Digit        = [0-9]
Indicator    = (e|E)

Rules.

{Sign}	    : {token, {sign, TokenLine, TokenChars}}.
{Digit}+    : {token, {digits, TokenLine, TokenChars}}.
{Indicator} : {token, {indicator, TokenLine, TokenChars}}.
.           : {token, {decimal_point, TokenLine, TokenChars}}.

Erlang code.

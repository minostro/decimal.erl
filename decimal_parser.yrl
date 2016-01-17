Nonterminals
numeric_string decimal_part exponent_part.


Terminals
sign digits decimal_point indicator.


Rootsymbol numeric_string.

decimal_part -> digits decimal_point digits : build_decimal('$1', '$3').
decimal_part -> decimal_point digits : build_decimal(empty, '$2').
decimal_part -> digits : build_decimal('$1', empty).

exponent_part -> indicator sign digits : build_exponent('$2', '$3').
exponent_part -> indicator digits : build_exponent(empty, '$2').

numeric_string -> sign decimal_part exponent_part : {number, build_sign('$1'), '$2', '$3'}.
numeric_string -> decimal_part exponent_part : {number, build_sign(empty), '$1', '$2'}.
numeric_string -> sign decimal_part : {number, build_sign('$1'), '$2', build_exponent(empty, empty)}.
numeric_string -> decimal_part : {number, build_sign(empty), '$1', build_exponent(empty, empty)}.


Erlang code.
build_exponent({_, _, Sign}, {_, _, Digits}) ->
  {exponent, Sign, Digits};
build_exponent(Sign, {_, _, Digits}) ->
  {exponent, Sign, Digits};
build_exponent(Sign, Digits) ->
  {exponent, Sign, Digits}.

build_decimal({_, _, Left}, {_, _, Right}) ->
  {decimal, Left, Right};
build_decimal(Left, {_, _, Right}) ->
  {decimal, Left, Right};
build_decimal({_, _, Left}, Right) ->
  {decimal, Left, Right}.

build_sign({_, _, Value}) ->
  {sign, Value};
build_sign(Value) ->
  {sign, Value}.

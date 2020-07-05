-module(factorial).

-export([factorial/1]).

factorial(1) -> 1;
factorial(Num) -> Num * factorial(Num - 1).
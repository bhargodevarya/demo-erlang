-module(process).

-export([run/0, greet/2]).

greet(Greeting, 0) ->
    %%io:fwrite(Greeting ++ "\n");
    done;
greet(Greeting, N) ->
    io:fwrite(Greeting ++ "\n"),
    greet(Greeting, N -1).


%%run() -> greet("Hello", 3).

%%tarting 2 threads that call the same method with diff params
%%In, java similar to using 2 threads to call the same method, each thread passes diff params
run() ->
    spawn(process, greet, ["Hello", 3]),
    spawn(process, greet, ["Namaste", 3]).
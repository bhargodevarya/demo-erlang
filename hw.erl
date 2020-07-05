-module(hw).

-export([helloworld/0, helloworld/1]).

helloworld() -> "Hello World again".

helloworld(X) ->
  "Hello " ++ X.
%% module declaration, similar to class decalarations
%% Every statement ends with a .
-module(hw).

%% Export statment similar to nodejs
%% [] means a list <functionName/num_of_params_it_accepts>
-export([helloworld/0, helloworld/1]).

%% 2 overloaded functions
helloworld() -> "Hello World again".

%% Variabled must start with Cap letter or _
helloworld(X) ->
  "Hello " ++ X.
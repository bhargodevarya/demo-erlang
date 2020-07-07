-module(talk).

-export([run/0, bob/2, alice/0]).

alice() ->
    receive
        %% Pattern matching for the mesage received 
        %% by the method.
        %% if 2 params are received, this will be executed
        %%
        {message, Pid} -> io:fwrite("Alice got a mesage \n"),
        %% Sending message to another process
        Pid ! message,

        %% This I think is more like wait, call the function without any matchers.
        %% To make sure that the process does not finish and waits for a message
        alice();
        %%
        %% Atom to signal what to do when message
        %% passing is done
        finished -> io:fwrite("Alice am done too \n")
    end.

bob(0, Pid) ->
    io:fwrite("Bob is my last message \n"),
    Pid ! finished;
bob(N, Pid) ->
    Pid ! {message, self()},
    receive
        message -> io:fwrite("Bob got a message \n")
    end,
    bob(N-1, Pid).

run() ->
    %% Spwan first process
    AlicePid = spawn(talk, alice, []),
    %% Spawn second process and send the process id a param.
    %% This id is used to pass message back to process
    BobPid = spawn(talk, bob, [3, AlicePid]).
-module(prob3).
-export([printi/1, printe/1]).

printi(N) -> pi_acc(N, []).

pi_acc(0, List) -> io:format("Number:~w~n", [List]);
pi_acc(N, List) -> pi_acc(N-1, [N | List]).

printe(N) -> pe_acc(N, []).

pe_acc(0, List) -> io:format("Number:~p~n", [List]);
pe_acc(N, List) when N rem 2 == 0 -> pe_acc(N-1, [N | List]);
pe_acc(N, List) -> pe_acc(N-1, List).
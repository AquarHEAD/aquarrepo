-module(prob5).
-export([filter/2, reverse/1, concatenate/1, flatten/1]).

filter(List, N) -> filter_acc(List, N, []).

filter_acc([], _N, Ret)-> Ret;
filter_acc([Head | Tail], N, Ret) when Head =< N -> [Head | filter_acc(Tail, N, Ret)];
filter_acc([_Head | Tail], N, Ret) -> filter_acc(Tail, N, Ret).

reverse(List) -> racc(List, []).

racc([], Ret) -> Ret;
racc([Head | Tail], Ret) -> racc(Tail, [Head | Ret]).

concatenate(List) -> cacc(List, []).

cacc([], Ret) -> Ret;
cacc([Head | Tail], Ret) ->
  Tmp = cacc(Tail, Ret),
  cadd(Head, Tmp).

cadd([], Ret) -> Ret;
cadd([Head | Tail], Ret) -> [Head | cadd(Tail, Ret)].

flatten(List) -> [].
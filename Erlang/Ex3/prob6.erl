-module(prob6).
-export([qsort/1]).

qsort([]) -> [];
qsort([Head | Tail]) ->
  Left = getl(Head, Tail),
  Right = getr(Head, Tail),
  qsort(Left) ++ [Head] ++ qsort(Right).

getl(_N, []) -> [];
getl(N, [Head | Tail]) when Head < N -> [Head | getl(N, Tail)];
getl(N, [_Head | Tail]) -> getl(N, Tail).

getr(_N, []) -> [];
getr(N, [Head | Tail]) when Head >= N -> [Head | getr(N, Tail)];
getr(N, [_Head | Tail]) -> getr(N, Tail).
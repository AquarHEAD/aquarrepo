-module(demo).
-export([double/1, bump/1, average/1, even/1, member/2, sumx/1]).

% Comment Example

double(Value) ->
  times(Value, 2).
times(X, Y) ->
  X*Y.
  
bump([]) -> [];
bump([Head | Tail]) -> [Head + 1 | bump(Tail)].

sum([]) -> 0;
sum([Head | Tail]) -> Head + sum(Tail).

len([]) -> 0;
len([_ | Tail]) -> 1 + len(Tail).

average(List) ->
  Sum = sum(List),
  Len = len(List),
  if
    Len == 0 -> 0;
    true -> Sum / Len
  end.
  
even([]) -> [];
even([Head | Tail]) when Head rem 2 == 0 -> [Head | even(Tail)];
even([_ | Tail]) -> even(Tail).
  
member(_, []) -> false;
member(H, [H | _]) -> true;
member(H, [_ | T]) -> member(H, T).

sumx(Boundary) -> sum_acc(1, Boundary, 0).

sum_acc(Index, Boundary, Sum) when Index =< Boundary ->
  sum_acc(Index + 1, Boundary, Sum + Index);
sum_acc(_I, _B, Sum) ->
  Sum.
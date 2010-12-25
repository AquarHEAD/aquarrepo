-module(db).
-export([new/0, destroy/1, write/3, delete/2, read/2, match/2]).

% A rough solution for problem 4

new() -> [].

destroy(_Db) -> ok.

write(Key, Element, Db) -> [{Key, Element} | Db].

delete(Key, Db) -> dacc(Key, Db, []).

dacc(_Key, [], NewDb) -> NewDb;
dacc(Key, OldDb, NewDb) ->
  [Head | Tail] = OldDb,
  Test = (element(1, Head) == Key),
  case Test of
    true -> dacc(Key, Tail, NewDb);
    false -> dacc(Key, Tail, [Head | NewDb])
  end.

read(_Key, []) -> {error, instance};
read(Key, [Head | _Tail]) when (element(1, Head) == Key) -> {ok, element(2, Head)};
read(Key, [_Head | Tail]) -> read(Key, Tail).

match(Element, Db) -> macc(Element, Db, []).

macc(_Element, [], Ret) -> Ret;
macc(Element, [Head | Tail], Ret) when (element(2, Head) == Element) -> macc(Element, Tail, [element(1, Head) | Ret]);
macc(Element, [_Head | Tail], Ret) -> macc(Element, Tail, Ret).
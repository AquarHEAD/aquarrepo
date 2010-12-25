-module(prob2).
-export([create/1, reverse_create/1]).

create(N) -> c_acc(N, []).

c_acc(0, List) -> List;
c_acc(N, List) -> c_acc(N-1, [N | List]).

reverse_create(0) -> [];
reverse_create(N) -> [N | reverse_create(N-1)].
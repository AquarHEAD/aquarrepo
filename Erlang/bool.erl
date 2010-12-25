-module(bool).
-export([b_not/1, b_and/2, b_nand/2]).

b_not(true) ->
  false;
b_not(false) ->
  true.

b_and(true, B) ->
  B;
b_and(false, _B) ->
  false.
  
b_nand(A, B) ->
  b_not(b_and(A,B)).
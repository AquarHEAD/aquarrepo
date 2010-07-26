Program Coin;
Var
 n,i,j : Integer;
 w : Array[1..50] Of Boolean;

Begin
 Assign(input,'coin.in');
 Reset(input);
 Assign(output,'coin.out');
 Rewrite(output);
 Readln(n);
 Writeln(n);
 For i:=1 to n do
 Begin
  For j:=1 to n do
   If j<>i then
    w[j]:=Not w[j];
  For j:=1 to n do
   If w[j] then
    Write(1)
   Else
    Write(0);
  Writeln;
 End;
 Close(input);
 Close(output);
End.
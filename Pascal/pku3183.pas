Program pku3183;
Var
 w : Array[1..50000] Of Longint;
 i,n : Longint;
Begin
 Readln(n);
 For i:=1 to n do
  Readln(w[i]);
 For i:=1 to n do
 Begin
  If (i>1) And (w[i-1]>w[i]) then
   Continue;
  If (i<n) And (w[i+1]>w[i]) then
   Continue;
  Writeln(i);
 End;
End.
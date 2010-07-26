Program pku3191;
Var
 a : Array[1..10000] Of Integer;
 k,i,n : Longint;
Begin
 Readln(n);
 k:=0;
 Repeat
  Inc(k);
  a[k]:=Abs(n mod 2);
  n:=-Trunc((n-a[k])/2);
 Until n=0;
 For i:=k downto 1 do
  Write(a[i]);
 Writeln;
End.
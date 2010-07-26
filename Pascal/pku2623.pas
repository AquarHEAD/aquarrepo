Program pku2623;
Var
 n,i : Longint;
 w : Array[1..250000] Of Int64;

Procedure Sort(l,r : Longint);
Var
 i,j,x,y : Longint;
Begin
 i:=l;
 j:=r;
 x:=w[(l+r) div 2];
 Repeat
  While w[i]<x do Inc(i);
  While x<w[j] do Dec(j);
  If i<=j then
  Begin
   y:=w[i];
   w[i]:=w[j];
   w[j]:=y;
   Inc(i);
   Dec(j);
  End;
 Until i>j;
 If i<r then Sort(i,r);
 If l<j then Sort(l,j);
End;

Begin
 Readln(n);
 For i:=1 to n do
  Readln(w[i]);
 Sort(1,n);
 If Odd(n) then
  Writeln(w[(n+1) div 2],'.0')
 Else
  Writeln((w[n div 2]+w[n div 2+1])/2:0:1);
End.
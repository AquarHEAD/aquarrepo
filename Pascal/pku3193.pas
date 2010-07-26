Program pku3193;
Var
 ph : Array[1..1000] Of String;

Procedure Sort(l,r : Longint);
Var
 i,j : Longint;
 x,y : String;
Begin
 i:=l;
 j:=r;
 x:=ph[(l+r) div 2];
 Repeat
  While ph[i]<x do Inc(i);
  While x<ph[j] do Dec(j);
  If i<=j then
  Begin
   y:=ph[i];
   ph[i]:=ph[j];
   ph[j]:=y;
   Inc(i);
   Dec(j);
  End;
 Until i>j;
 If i<r then Sort(i,r);
 If l<j then Sort(l,j);
End;

Function Search(l,r : Longint;s : String) : Boolean;
Begin

End;

Begin
 Readln(m,n);
 For i:=1 to m do
  Readln(ph[i]);
 Sort(1,m);
 For i:=1 to n do
 Begin
  l:=1;
  r:=m;
  While r-l>0 do
  Begin

  End;
 End;
End.
Program p1037;
Var
 f : Array[0..100,0..100000] Of Longint;
 h : Array[1..100] Of Longint;
 i,n,j,sum : Longint;

Function Max(a,b : Longint) : Longint;
Begin
 If a>b then
  Exit(a)
 Else
  Exit(b);
End;

Begin
 Readln(n);
 For i:=1 to n do
  Read(h[i]);
 sum:=0;
 For i:=1 to n do
 Begin
  sum:=sum+h[i];
  For j:=0 to sum do
  Begin
   f[i,j]:=f[i-1,j];
   If h[i]<=j then
    f[i,j-h[i]]:=Max(f[i,j-h[i]],f[i-1,j]);
   If h[i]>=j then
    f[i,h[i]-j]:=Max(f[i,h[i]-j],f[i-1,j]+h[i]-j);
  End;
  For j:=sum downto 0 do
   f[i,j+h[i]]:=Max(f[i,j+h[i]],f[i-1,j]+h[i]);
 End;
 If f[n,0]=0 then
  Writeln('Impossible')
 Else
  Writeln(f[n,0]);
End.
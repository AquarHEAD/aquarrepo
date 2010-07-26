Program Budget;
Type
 TKind = Record
          x : Integer;
          v,p : Array[0..2] Of Longint;
         End;
Var
 n,m,k : Longint;
 w : Array[1..60] Of TKind;
 f : Array[0..60,0..32000] Of Longint;
 main : Array[1..60] Of Integer;

Procedure Reading;
Var
 i,vx,px,qx : Longint;
Begin
 Readln(n,m);
 k:=0;
 For i:=1 to m do
 Begin
  Readln(vx,px,qx);
  If qx=0 then
  Begin
   Inc(k);
   main[i]:=k;
   With w[k] do
   Begin
    x:=0;
    v[0]:=vx;
    p[0]:=px;
    v[1]:=0;
    v[2]:=0;
    p[1]:=0;
    p[2]:=0;
   End;
  End
  Else
   With w[main[qx]] do
   Begin
    Inc(x);
    v[x]:=vx;
    p[x]:=px;
   End;
 End;
End;

Function Max(a,b : Longint) : Longint;
Begin
 If a>b then
  Exit(a)
 Else
  Exit(b)
End;

Procedure Doing;
Var
 i,j : Longint;
Begin
 For i:=1 to k do
  With w[i] do
   For j:=1 to n do
   Begin
    f[i,j]:=f[i-1,j];
    If j>=v[0] then
     f[i,j]:=Max(f[i,j],f[i-1,j-v[0]]+v[0]*p[0]);
    If j>=v[0]+v[1] then
     f[i,j]:=Max(f[i,j],f[i-1,j-v[0]-v[1]]+v[0]*p[0]+v[1]*p[1]);
    If j>=v[0]+v[2] then
     f[i,j]:=Max(f[i,j],f[i-1,j-v[0]-v[2]]+v[0]*p[0]+v[2]*p[2]);
    If j>=v[0]+v[1]+v[2] then
     f[i,j]:=Max(f[i,j],f[i-1,j-v[0]-v[1]-v[2]]+v[0]*p[0]+v[1]*p[1]+v[2]*p[2]);
   End;
End;

Begin
 Assign(input,'budget.in');
 Reset(input);
 Assign(output,'budget.out');
 Rewrite(output);
 Reading;
 Doing;
 Writeln(f[k,n]);
 Close(input);
 Close(output);
End.
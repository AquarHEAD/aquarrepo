Program Energy;
Var
 n,m : Integer;
 head,tail : Array[1..200] Of Longint;
 f : Array[1..200,1..200] Of Longint;

Procedure Reading;
Var
 i : Integer;
Begin
 Readln(n);
 For i:=1 to n do
  Read(head[i]);
 For i:=1 to n-1 do
  tail[i]:=head[i+1];
 tail[n]:=head[1];
 m:=2*n-1;
 For i:=n+1 to m do
 Begin
  head[i]:=head[i-n];
  tail[i]:=tail[i-n];
 End;
End;

Procedure Doing;
Var
 p,i,j,k : Integer;
 ans : Longint;
Begin
 For p:=1 to n-1 do
 For i:=1 to m-1 do
 Begin
  j:=i+p;
  If j>m then
   Break;
  For k:=i to j-1 do
   If f[i,k]+f[k+1,j]+head[i]*tail[k]*tail[j]>f[i,j] then
    f[i,j]:=f[i,k]+f[k+1,j]+head[i]*tail[k]*tail[j];
 End;
 ans:=0;
 For i:=1 to n do
  If f[i,i+n-1]>ans then
   ans:=f[i,i+n-1];
 Writeln(ans);
End;

Begin
 Assign(input,'energy.in');
 Reset(input);
 Assign(output,'energy.out');
 Rewrite(output);
 Reading;
 Doing;
 Close(input);
 Close(output);
End.
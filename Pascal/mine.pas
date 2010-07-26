Program Mine;
Var
 a,k : Array[1..10000] Of Integer;
 i,n,ans : Integer;

Function Calc_Sequence : Boolean;
Var
 i : Integer;
Begin
 Calc_Sequence:=True;
 If n>1 then
 Begin
  a[2]:=k[1]-a[1];
  If Not (a[2] In [0,1]) then
   Exit(False);
  For i:=3 to n do
  Begin
   a[i]:=k[i-1]-a[i-2]-a[i-1];
   If Not (a[i] In [0,1]) then
    Exit(False);
  End;
  If a[n-1]+a[n]<>k[n] then
   Exit(False);
 End
 Else
  If a[1]<>k[1] then
   Exit(False);
End;

Begin
 Assign(input,'mine.in');
 Reset(input);
 Assign(output,'mine.out');
 Rewrite(output);
 Readln(n);
 For i:=1 to n do
  Read(k[i]);
 ans:=0;
 a[1]:=0;
 If Calc_Sequence then
  Inc(ans);
 a[1]:=1;
 If Calc_Sequence then
  Inc(ans);
 Writeln(ans);
 Close(input);
 Close(output);
End.